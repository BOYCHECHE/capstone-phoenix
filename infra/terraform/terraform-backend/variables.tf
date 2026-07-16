variable "project_name" {
  description = "The name of the project in which to create the resources."
  type        = string
  default     = "taskapp-phoenix-cheche-001"
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
