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

variable "aws_region" {
  description = "The Aws region in which to create the resources."
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
#EC2 variables
variable "EC2" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "task-app"
  type        = string

}

#RDS variable
variable "db_instance_class" {
  description = "The instance for the RDS database."
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The master username for the RDS database"
  type        = string
  default     = "taskapp_admin"
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "aws_availability_zones" {
  description = "List of AWS availability zones"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "SSH key pair name for EC2 instances"
  type        = string
}

variable "instance_type" {
  type = string
}


