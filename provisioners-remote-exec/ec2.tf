resource "aws_instance" "t_remote_exec" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = "ansible"
  vpc_security_group_ids = ["sg-0c56a08ac6a78f8f2"]

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "ec2-user:hello123" | sudo chpasswd
              sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
              sudo systemctl restart sshd
              EOF

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = data.aws_secretsmanager_secret_version.ssh_password.secret_string
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf update -y",
      "sudo dnf install -y nginx",
      "echo '<h1>Deployed via Terraform Remote Exec Provisioner</h1>' | sudo tee /var/www/html/index.html",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }


  tags = {
    Name = "remote-exec-instance"
  }
}
