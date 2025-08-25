resource "aws_instance" "demo" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  key_name      = "jenkins_server"

  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  # Root Volume
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "demo-instance"
  }
}
