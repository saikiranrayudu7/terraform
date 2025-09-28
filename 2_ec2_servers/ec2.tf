resource "aws_instance" "installing_2_servers" {
  for_each               = var.instances
  ami                    = var.ami_id
  instance_type          = each.value
  key_name               = var.keyname
  vpc_security_group_ids = var.sg_type

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  user_data = <<-EOF
            #!/bin/bash
            # Enable password authentication
            sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
            sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
            echo "ChallengeResponseAuthentication yes" >> /etc/ssh/sshd_config
            echo "UsePAM yes" >> /etc/ssh/sshd_config

            # Set password for ec2-user
            echo "ec2-user:hello" | chpasswd

            # Restart sshd to apply changes
            systemctl restart sshd
            EOF

  tags = {
    Name = each.key
  }
}
