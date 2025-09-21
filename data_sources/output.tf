output "name" {
  value = data.aws_ami.amazon_linux_3.id
}

output "vpc_info" {
  value = data.aws_vpc.default
}