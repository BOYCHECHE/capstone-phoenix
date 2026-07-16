variable "project_name" {
  description = "Project name"
  type        = string
  default     = "taskapp-capstone"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ssh_key_name" {
  description = "AWS EC2 Key Pair"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into nodes"
  type        = string
}
