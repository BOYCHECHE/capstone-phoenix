resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-${var.environment}-db"

  engine         = "postgres"
  instance_class = var.db_instance_class

  allocated_storage   = 20
  storage_type        = "gp3"
  storage_encrypted   = true
  publicly_accessible = false

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [var.db_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.this.name

  skip_final_snapshot = true

  backup_retention_period = 7
  multi_az                = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-db"
    Environment = var.environment
  }
}
