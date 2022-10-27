resource "aws_db_instance" "defaultg" {
  #depends_on             = ["${aws_security_group.defaultg}"]
  identifier        = var.identifier
  allocated_storage = var.storage
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  name              = var.db_name
  username          = var.user
  password          = var.pass

  vpc_security_group_ids = ["${aws_security_group.rds_sgroup.id}"]
  db_subnet_group_name   = aws_db_subnet_group.defaultg.id
  skip_final_snapshot    = "true"
}

resource "aws_security_group" "rds_sgroup" {
  name        = "rds_sgroup"
  description = "Allow all inbound traffic"
  vpc_id      = module.networking.vpc_id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}"
  }
}

resource "aws_db_subnet_group" "defaultg" {
  name        = "main_subnet_group_one"
  description = "Our main group of subnets"
  subnet_ids  = [element(module.networking.private_subnets_id, 0), element(module.networking.private_subnets_id, 1)]
}

