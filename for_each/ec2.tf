resource "aws_instance" "ec2_instance" {
  for_each      = var.instance_type
  ami           = "ami-00ca32bbc84273381"
  instance_type = each.value
  key_name      = "ansible"

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "demo-instance-${each.key}"
  }
}
