resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_name == "web-server" ? var.instance_type : "t2.large"
  key_name      = var.keyname

  vpc_security_group_ids = var.sg_type

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name =var.instance_name
  }
}


# resource "aws_instance" "web" {
#   for_each = var.instances

#   ami           = var.ami_id
#   instance_type = each.value
#   key_name      = var.keyname

#   vpc_security_group_ids = var.sg_type

#   root_block_device {
#     volume_size           = 30
#     volume_type           = "gp3"
#     delete_on_termination = true
#   }

#   tags = {
#     Name = each.key
#   }
# }
