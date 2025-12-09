resource "aws_spot_instance_request" "demo" {
  ami           = "ami-0341d95f75f311023"
  instance_type = "t2.micro"
  spot_type     = "persistent"        # or "one-time"
  spot_price    = "0.020"             # OR remove it to use current market price
  key_name      = "ansible"

  vpc_security_group_ids = var.sg_type

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "demo-spot"
  }
}
