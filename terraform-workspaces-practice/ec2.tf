resource "aws_instance" "workspace" {
  ami                    = var.ami_id
  for_each = var.instance_type 
  instance_type          = lookup(var.instance_type, terraform.workspace, each.value)
  key_name               = "ansible"
  vpc_security_group_ids = ["sg-0c56a08ac6a78f8f2"]

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "workspace-instance-${each.key}"
  }
}