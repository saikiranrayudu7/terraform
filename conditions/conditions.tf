resource "aws_instance" "conditions" {
  ami           = var.ami_id
  instance_type = var.instance_name == "Conditions_MongoDB" ? "t3.micro" : "t2.micro"

  tags = {
    Name = var.instance_name == "Conditions_MongoDB" ? var.instance_name : "Default Instance"
  }
}
