resource "aws_db_instance" "mysql" {

  identifier = "project-mysql"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = var.db_instance_class

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 3306

  publicly_accessible = false

  storage_encrypted = true


  multi_az = false

  db_subnet_group_name = module.vpc.database_subnet_group_name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  skip_final_snapshot = true

  deletion_protection = false

  tags = {
    Name = "${var.cluster_name}-mysql"
  }
}