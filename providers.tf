provider "launchdarkly" {
  access_token = var.access_token
}

# Specify the providers required to run this configuration
terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "~> 2.0"
    }
  }
}