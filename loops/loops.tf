resource "aws_instance" "loop" {
    count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_names[count.index]
  }
}