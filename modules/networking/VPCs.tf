/*==== The VPC ======*/
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "demo-vpc"
    Environment = "${var.environment}"
  }
}
#resource "aws_db_subnet_group" "default" {
#  name        = "main_subnet_group"
#  description = "Our main group of subnets"
#  subnet_ids  = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
#}



/*
resource "aws_db_instance" "rds_instance" {

allocated_storage = 20
identifier = "rds-terraform"
storage_type = "gp2"
engine = "mysql"
engine_version = "8.0.27"
availability_zone  = "us-east-1a"
instance_class = "db.t2.micro"
name = "yourdbname"
username = "yourdbusername"
password = "yourpassword"
publicly_accessible    = true
skip_final_snapshot    = true
db_subnet_group_name = aws_db_subnet_group.default.name

  tags = {
    Name = "ExampleRDSServerInstance"
  }
}


*/