resource "aws_instance" "module_practice" {
  ami = var.ami_id
  instance_type = var.instance_type
    key_name = "ansible"
    vpc_security_group_ids = ["sg-0c56a08ac6a78f8f2"]
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "module-practice-instance"
    }
}