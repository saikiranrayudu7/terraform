resource "aws_security_group" "terraform-sg-demo" {
  name        = var.sg-name
  description = var.sg-description

  ingress {
    description = var.ingress-description
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = var.egress-description
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-name
  }
}
