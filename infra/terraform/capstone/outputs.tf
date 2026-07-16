output "k3s_public_ips" {
  value = module.k3s_nodes.public_ips
}

output "k3s_private_ips" {
  value = module.k3s_nodes.private_ips
}

output "k3s_public_dns" {
  value = module.k3s_nodes.public_dns
}

output "k3s_instance_ids" {
  value = module.k3s_nodes.instance_ids
}
