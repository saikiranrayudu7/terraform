resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.terraform-sg-demo.id ]

  tags = var.tags
}
