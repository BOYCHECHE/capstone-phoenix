provider "aws" {
  region = var.aws_region
}

#S3 bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_name}-terraform-state"

  tags = {
    Name        = "${var.project_name}-terraform_state"
    Environment = var.environment
  }
}

# Enable versioning for the s3 bucket
# This ensures that we can recover previous versions of the state incase of accidental deletion or corrupt
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Encrypt the s3 bucket using AWS KMS to ensure that the terraform state file is stored securely
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id


  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

# Create a DynamoDB table for Terraform state locking
# This table will be used to manage locks on the Terraform state file, preventing concurrrent modifications that
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.project_name}.terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.project_name}-terraform-state-lock"
    Environment = var.environment
  }
}

