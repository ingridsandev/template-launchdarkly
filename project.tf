# Local variable to determine if approval_settings block is needed
locals {
  approval_settings_for_env = { for env in local.environments : env.name => env.name == "higher" }
}

# Create a LaunchDarkly project with environments
resource "launchdarkly_project" "project" {
  key  = var.project_name
  name = var.project_name
  tags = local.common_tags

  dynamic "environments" {
    for_each = local.environments

    content {
      key   = environments.value.name
      name  = environments.value.name
      color = environments.value.color
      tags  = environments.value.tags
 
      dynamic "approval_settings" {
        for_each = local.approval_settings_for_env[environments.value.name] ? [1] : []

        content {
          can_review_own_request     = false
          can_apply_declined_changes = false
          min_num_approvals          = 1
          required_approval_tags     = ["approvals_required"]
        }
      }
    }
  }
}