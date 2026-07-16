variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "A list of cidr blocks for the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "A list od cidr blocks for the private subnet"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "aws_availability_zones" {
  description = "The avaliable AWS zone for the subnets"
  type        = list(string)
  default     = ["en-north-1a", "en-north-1b"]
}

