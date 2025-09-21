resource "aws_instance" "web_terraform" {
    ami = data.aws_ami.amazon_linux_3.id
    instance_type = var.instance_type
    key_name = var.key_name

    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }

    tags = {
      Name = var.tag_name
    }
}
