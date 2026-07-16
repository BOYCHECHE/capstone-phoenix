output "aws_availability_zones" {
  description = "List of availability zones in the region"
  value       = module.core.aws_availability_zones
}

output "ubuntu_aws_id" {
  description = "The ID of the latest Ubuntu 24.04 AMI in the specified region"
  value       = module.core.ubuntu_ami_id
}

output "vpc_id" {
  description = "ID of the VPC created"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC created"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets created"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets created"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "IDs of the internet Gateway created"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "IDs of the NAT Gateway created"
  value       = module.vpc.nat_gateway_id
}

output "nat_gateway_public_id" {
  description = "Public IP address of the NAT Gateway"
  value       = module.vpc.nat_gateway_public_ip
}

# Outputs for the Security Groups module
output "frontend_security_group_id" {
  description = "ID of the frontend security group created"
  value       = module.security_groups.frontend_security_group_id
}

output "backend_security_group_id" {
  description = "ID of the frontend security group created"
  value       = module.security_groups.backend_security_group_id
}

output "db_security_group_id" {
  description = "ID of the database security group created"
  value       = module.security_groups.db_security_group_id
}
/*
output "frontend_instance_id" {
  value = module.ec2.frontend_instance_id
}

output "frontend_public_ip" {
  value = module.ec2.frontend_public_ip
}

output "frontend_private_ip" {
  value = module.ec2.frontend_private_ip
}


output "frontend_public_dns" {
  value = module.ec2.frontend_public_dns
}


output "backend_instance_id" {
  value = module.ec2.backend_instance_id
}


output "backend_public_ip" {
  value = module.ec2.backend_public_ip
}


output "backend_private_ip" {
  value = module.ec2.backend_private_ip
}


output "backend_public_dns" {
  value = module.ec2.backend_public_dns
}
*/

# Output for RDS Modules
output "db_instance_id" {
  value = module.rds.db_instance_id
}

output "db_address" {
  value = module.rds.db_endpoint
}

output "db_port" {
  value = module.rds.db_port
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_name" {
  value = module.rds.db_name
}

output "db_username" {
  value = module.rds.db_username
}

output "db_connection_string" {
  value = format(
    "postgresql://%s@%s/%s",
    var.db_username,
    module.rds.db_endpoint,
    module.rds.db_name
  )
}


output "k3s_public_ips" {
  description = "Public IPs of Kubernetes nodes"
  value       = module.k3s_nodes.public_ips
}

output "k3s_private_ips" {
  description = "Private IPs of Kubernetes nodes"
  value       = module.k3s_nodes.private_ips
}

output "k3s_public_dns" {
  description = "Public DNS of Kubernetes nodes"
  value       = module.k3s_nodes.public_dns
}

output "k3s_instance_ids" {
  description = "Instance IDs of Kubernetes nodes"
  value       = module.k3s_nodes.instance_ids
}
