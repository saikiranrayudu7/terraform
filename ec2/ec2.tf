resource "aws_instance" "demo" {
  ami           = "ami-0360c520857e3138f" #ubuntu
  instance_type = "t2.micro"
  key_name      = "ansible"
  vpc_security_group_ids = var.sg_type

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "demo-instance"
  }
}
