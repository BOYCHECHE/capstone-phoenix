resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.key_name

  subnet_id              = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.frontend_sg_id]

  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-frontend"
    Environment = var.environment
    Role        = "frontend"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "backend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.key_name

  subnet_id              = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.backend_sg_id]

  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-backend"
    Environment = var.environment
    Role        = "backend"
  }

  lifecycle {
    create_before_destroy = true
  }
}
