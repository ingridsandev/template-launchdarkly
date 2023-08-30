# Local variables for common settings
locals {
  name              = "Enable hello world"
  description       = "This flag will enable a hello world modal"
  variation_type    = "boolean"
  default_off_variation = 1
  default_on_variation  = 0
  key = replace(lower(local.name), " ", "-")
}

# Feature flag for enabling "Hello World"
resource "launchdarkly_feature_flag" "enable_hello_world" {
  project_key     = launchdarkly_project.project.key
  key             = local.key
  name            = local.name
  description     = local.description
  variation_type  = local.variation_type

  variations {
    value = true
  }

  variations {
    value = false
  }

  defaults {
    off_variation = local.default_off_variation
    on_variation  = local.default_on_variation
  }
  tags = local.common_tags
}

# Environment-specific rules for "Hello World" feature flag
resource "launchdarkly_feature_flag_environment" "enable_hello_world_lower" {
  flag_id = launchdarkly_feature_flag.enable_hello_world.id
  env_key = local.environments.lower.name

  # Rule for targeting specific environments
  rules {
    description = "targeting by environments"

    clauses {
      context_kind = "env"
      attribute    = "key"
      op           = "in"
      values       = ["dev"]
      negate       = true
    }
    variation = local.default_on_variation
  }
  off_variation = local.default_off_variation

  # Fallthrough rule
  fallthrough {
    variation = local.default_on_variation
  }
}