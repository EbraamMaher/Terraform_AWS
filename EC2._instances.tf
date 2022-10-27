###public instance(jumphost)
resource "aws_instance" "ec2jumphost" {
  ami             = var.amazon_machine_image
  instance_type   = var.instance_type
  subnet_id       = element(module.networking.public_subnets_id, 0)
  security_groups = [module.networking.ssh]

  key_name                = var.key
  disable_api_termination = false
  ebs_optimized           = false

  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "Jumphost"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ips.txt "
  }
}



####private instance(application)
resource "aws_instance" "private" {
  instance_type   = var.instance_type
  ami             = var.amazon_machine_image
  security_groups = [module.networking.ssh_port3000]
  subnet_id       = element(module.networking.private_subnets_id, 0)

  key_name                = var.key
  disable_api_termination = false
  ebs_optimized           = false

  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "application"
  }
}


