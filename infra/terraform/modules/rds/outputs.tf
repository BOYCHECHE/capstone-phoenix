output "db_endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "RDS connection endpoint"
}

output "db_port" {
  value       = aws_db_instance.this.port
  description = "RDS port"
}

output "db_name" {
  value = aws_db_instance.this.db_name
}

output "db_instance_id" {
  value = aws_db_instance.this.id
}

output "db_username" {
  value = var.db_username
}
