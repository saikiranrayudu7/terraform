resource "aws_instance" "loop-demo" {
  count         = length(var.instance_name)
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = ["sg-0a7c2b5877b68a711"]

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }

  associate_public_ip_address = (
    var.instance_name[count.index] == "web-server" ? true : false
  )

  tags = {
    Name = "${var.instance_name[count.index]}"
  }
}
