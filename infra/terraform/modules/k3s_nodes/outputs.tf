output "public_ips" {
  description = "Public IPs of Kubernetes nodes"

  value = {
    for name, instance in aws_instance.node :
    name => instance.public_ip
  }
}

output "private_ips" {
  description = "Private IPs of Kubernetes nodes"

  value = {
    for name, instance in aws_instance.node :
    name => instance.private_ip
  }
}

output "public_dns" {
  description = "Public DNS names of Kubernetes nodes"

  value = {
    for name, instance in aws_instance.node :
    name => instance.public_dns
  }
}

output "instance_ids" {
  description = "Instance IDs of Kubernetes nodes"

  value = {
    for name, instance in aws_instance.node :
    name => instance.id
  }
}
