terraform {
  backend "s3" {
    bucket         = "[YOUR_BUCKET_NAME]"
    key            = "path/to/your/terraform.tfstate"
    region         = "[REGION_OF_YOUR_PREFERENCE]"
    encrypt        = true
  }
}