resource "aws_vpc" "roboshop" {
  cidr_block = "1.0.0.0/16"
  enable_dns_hostnames = true
}