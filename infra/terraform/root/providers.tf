provider "aws" {
  region = var.aws_region


  default_tags {
    tags = {
      project     = var.project_name
      Environment = var.environment
      Managedby   = "Terraform"
      Owner       = "DevOps-phoenix"
      Createdby   = "Terraform"
    }
  }
  retry_mode  = "standard"
  max_retries = 5
}

