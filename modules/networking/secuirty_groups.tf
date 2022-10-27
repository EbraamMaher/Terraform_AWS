##secuirty group to allow port 3000  and ssh

resource "aws_security_group" "ssh_port3000" {
  name        = "demo-port3000-ssh-sg"
  description = "security group that allow  port 3000 and ssh from vpc cidr only"
  vpc_id      = aws_vpc.vpc.id
  #depends_on  = [aws_vpc.vpc]

  /* Allow only port 3000 traffic from internet */
  ingress {
    from_port = "3000"
    to_port   = "3000"
    protocol  = "TCP"
    #self      = true
    cidr_blocks      = ["10.0.0.0/16"]
   
  }
 /* Allow only port ssh traffic from internet */
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "TCP"
    #self      = true
    cidr_blocks      = ["10.0.0.0/16"]
    
  }


  /* Allow all outbound traffic to internet */
  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Environment = "${var.environment}"
  }
}




resource "aws_security_group" "ssh" {
  name        = "demo-ssh-sg"
  description = "security group that allow ssh from 0.0.0.0/0"
  vpc_id      = aws_vpc.vpc.id
  #depends_on  = [aws_vpc.vpc]

 /* Allow only port ssh traffic from internet */
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "TCP"
    #self      = true
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  /* Allow all outbound traffic to internet */
  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Environment = "${var.environment}"
  }
}
