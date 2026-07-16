resource "local_file" "terraform_output" {
  content = jsonencode({
    nodes  = module.k3s_nodes.public_ips
    vpc_id = module.vpc.vpc_id
  })

  filename = "${path.root}/../../ansible/terraform_output.json"
}
