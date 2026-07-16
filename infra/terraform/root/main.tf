data "aws_availability_zones" "available" {
  state = "available"
}

module "core" {
  source = "../modules/core"

  project_name         = var.project_name
  environment          = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  aws_availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
  aws_region             = var.aws_region
}

module "vpc" {
  source = "../modules/vpc"

  vpc_cidr               = "10.0.0.0/16"
  public_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs   = ["10.0.10.0/24", "10.0.11.0/24"]
  aws_availability_zones = ["eu-north-1a", "eu-north-1b"]

  project_name = var.project_name
  environment  = var.environment
}

module "security_groups" {
  source            = "../modules/security_groups"
  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  allowed_ssh_cidrs = ["0.0.0.0/0"]
}

/*
module "ec2" {
  source             = "../modules/ec2"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  frontend_sg_id     = module.security_groups.frontend_security_group_id
  backend_sg_id      = module.security_groups.backend_security_group_id
  instance_type      = var.instance_type
  key_name           = var.ssh_key_name
  ami_id             = module.core.ubuntu_ami_id
  private_subnet_ids = module.vpc.private_subnet_ids

}

*/

module "k3s_nodes" {
  source = "../modules/k3s_nodes"

  project_name = var.project_name
  environment  = var.environment

  ami_id    = module.core.ubuntu_ami_id
  key_name  = var.ssh_key_name

  # We'll refine the security group shortly
  security_group_id = module.security_groups.frontend_security_group_id

  nodes = {
    k3s-master = {
      role          = "server"
      subnet_id     = module.vpc.public_subnet_ids[0]
      instance_type = "t3.small"
    }

    k3s-worker-1 = {
      role          = "agent"
      subnet_id     = module.vpc.public_subnet_ids[1]
      instance_type = "t3.small"
    }

    k3s-worker-2 = {
      role          = "agent"
      subnet_id     = module.vpc.public_subnet_ids[0]
      instance_type = "t3.small"
    }
  }
}

module "rds" {
  source               = "../modules/rds"
  project_name         = var.project_name
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_security_group_id = module.security_groups.db_security_group_id
  db_instance_class    = var.db_instance_class
  db_name              = "taskapp"
  db_username          = var.db_username
  db_password          = var.db_password
}

