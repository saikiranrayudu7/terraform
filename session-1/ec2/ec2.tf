resource "aws_instance" "web" {
  ami = "ami-0b83c7f5e2823d1f4"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" {
  name = "roboshop-all-aws"
  description = "Inbound rules"

  ingress {
    description = "Allow All Ports"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }
}