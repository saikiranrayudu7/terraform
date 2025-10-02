resource "aws_instance" "provisioner_demo" {
    ami                    = var.ami_id
    instance_type          = "t2.micro"
    key_name               = "ansible"
    vpc_security_group_ids = ["sg-0c56a08ac6a78f8f2"]
    
    root_block_device {
        volume_size           = 8
        volume_type           = "gp3"
        delete_on_termination = true
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > inventory"
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i inventory playbook.yml"
    }
    
    tags = {
        Name = "provisioner-demo-instance"
    }
  
}
