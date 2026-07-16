variable "project_name" {
  description = "The name of the project in which to create the resources."
  type        = string
  default     = "taskapp-phoenix"
}

variable "environment" {
  description = "The environment in which to create the resources."
  type        = string
  default     = "dev"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g. t2.micro, t3.micro)"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name to access the instance"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "frontend_sg_id" {
  description = "Security group ID for frontend EC2 instance"
  type        = string
}

variable "backend_sg_id" {
  description = "Security group ID for backend EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EC2 resources"
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

