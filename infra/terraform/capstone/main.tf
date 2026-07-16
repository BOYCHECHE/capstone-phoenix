data "aws_availability_zones" "available" {
  state = "available"
}

module "core" {
  source = "../modules/core"

  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.10.0/24",
    "10.0.11.0/24"
  ]

  aws_availability_zones = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )
}

module "vpc" {
  source = "../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.10.0/24",
    "10.0.11.0/24"
  ]

  aws_availability_zones = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )
}

module "k8s_security_group" {
  source = "../modules/k8s_security_group"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}


module "k3s_nodes" {
  source = "../modules/k3s_nodes"

  project_name = var.project_name
  environment  = var.environment

  ami_id            = module.core.ubuntu_ami_id
  key_name          = var.ssh_key_name
  security_group_id = module.k8s_security_group.security_group_id

  nodes = {
    k3s-master = {
      role          = "server"
      subnet_id     = module.vpc.public_subnet_ids[0]
      instance_type = "t3.small"
    }

    k3s-worker-1 = {
      role          = "worker"
      subnet_id     = module.vpc.public_subnet_ids[1]
      instance_type = "t3.small"
    }

    k3s-worker-2 = {
      role          = "worker"
      subnet_id     = module.vpc.public_subnet_ids[0]
      instance_type = "t3.small"
    }
  }
}
