variable "ami_id" {
  default = "ami-08982f1c5bf93d976"
  type    = string
}


# Fetch secret from AWS Secrets Manager
data "aws_secretsmanager_secret_version" "ssh_password" {
  secret_id = "linux_pass"
}