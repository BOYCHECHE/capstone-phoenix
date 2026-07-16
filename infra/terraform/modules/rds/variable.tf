variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (dev/staging/prod)"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Database name"
  default     = "taskapp"
}

variable "db_username" {
  type        = string
  description = "Master username"
  default     = "taskapp_admin"
}

variable "db_password" {
  type        = string
  description = "Master password"
  sensitive   = true
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for RDS"
}

variable "db_security_group_id" {
  type        = string
  description = "Security group for RDS"
}

variable "db_engine" {
  type    = string
  default = "postgres"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_backup_retention_period" {
  type    = number
  default = 7
}

variable "db_multi_az" {
  type    = bool
  default = false
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for RDS networking"
}
