resource "aws_instance" "multi-env" {
    for_each = var.instance_names
    ami = var.ami_id
    instance_type = each.value
    key_name = var.keyname
    vpc_security_group_ids = var.sg_type

    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }

    tags = {
      Name = each.key
    }
}