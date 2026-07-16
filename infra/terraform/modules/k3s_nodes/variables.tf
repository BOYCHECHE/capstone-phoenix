variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "key_name" {
  description = "SSH key pair"
  type        = string
}

variable "security_group_id" {
  description = "Security group for Kubernetes nodes"
  type        = string
}

variable "nodes" {
  description = "Map of Kubernetes nodes"

  type = map(object({
    role          = string
    subnet_id     = string
    instance_type = string
  }))
}
