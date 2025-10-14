resource "aws_instance" "demo" {
  ami                    = "ami-052064a798f08f0d3"
  instance_type          = "t2.micro"
  key_name               = "ansible"
  vpc_security_group_ids = var.sg_type
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              # Update and install dependencies
              yum update -y
              yum install -y awscli jq

              # Wait for 5 minutes
              sleep 60

              # Get IMDSv2 token
              TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
                      -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

              # Get instance ID and region
              INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
                            http://169.254.169.254/latest/meta-data/instance-id)
              REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
                       http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

              # Terminate the instance
              aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region $REGION
              EOF

  tags = {
    Name = "demo-instance"
  }
}