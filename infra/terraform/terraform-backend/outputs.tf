output "state_bucket_name" {
  description = "The name of the s3 bucket used for Terraform state storage."
  value       = aws_s3_bucket.terraform_state.bucket
}

output "state_lock_table_name" {
  description = "The of the dynamoDB table used for Terraform state locking."
  value       = aws_dynamodb_table.terraform_state_lock.name
}

