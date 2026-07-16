variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "aws_availability_zones" {
  type = list(string)
}
variable "aws_region" {
  description = "AWS region for the core module"
  type        = string
}

