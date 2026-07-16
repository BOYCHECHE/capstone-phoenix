terraform {
  backend "s3" {
    bucket       = "taskapp-phoenix-cheche-001-terraform-state"
    key          = "root/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}

