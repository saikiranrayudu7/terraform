provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  sg_type       = var.sg_type
}
