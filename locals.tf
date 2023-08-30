# Common tags across all environments and resources
locals {
  common_tags = ["terraform", var.project_name]
}

# Environment-specific configurations
locals {
  environments = {
    lower = {

     envs = ["dev", "stg"]
      name  = "lower"
      color = "000000"
      tags  = concat(local.common_tags, ["non-prod"])
    },

    higher = {
      envs = ["prod", "dr"]
      name  = "higher"
      color = "EEEEEE"
      tags  = concat(local.common_tags, ["prod"])
    }
  }
}