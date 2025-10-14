resource "aws_instance" "demo" {
  ami           = "ami-052064a798f08f0d3"
  instance_type = "t2.micro"
  key_name      = "ansible"
  vpc_security_group_ids = var.sg_type

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  # 👇 Add this block
  user_data = <<-EOF
              #!/bin/bash
              # Wait for 5 minutes (300 seconds)
              sleep 300
              # Terminate this instance
              INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
              REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
              aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region $REGION
              EOF

  tags = {
    Name = "demo-instance"
  }
}
