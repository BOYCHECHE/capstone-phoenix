resource "aws_instance" "node" {
  for_each = var.nodes

  ami                         = var.ami_id
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = each.key
    Project     = var.project_name
    Environment = var.environment
    Role        = each.value.role
  }

  lifecycle {
    create_before_destroy = true
  }
}
