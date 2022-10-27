output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnets_id" {
  value = module.networking.public_subnets_id
}

output "private_subnets_id" {
  value = module.networking.private_subnets_id
}


output "ssh_port3000" {
  value = module.networking.ssh_port3000
}

output "ssh" {
  value = module.networking.ssh
}

/*output "jumphost_ip" {
  value = awseip.jumphost.public_ip
}

output "application_ip" {
  value = aws_instance.ec2instance.private_ip
}*/
