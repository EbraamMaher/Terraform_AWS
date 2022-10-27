output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnet.*.id
}


output "ssh_port3000" {
  value = "${aws_security_group.ssh_port3000.id}"
}

output "ssh" {
  value = "${aws_security_group.ssh.id}"
}