output "instance_id" {
  value = aws_spot_instance_request.demo.spot_instance_id
}

output "instance_public_ip" {
  value = aws_spot_instance_request.demo.public_ip
}

output "instance_private_ip" {
  value = aws_spot_instance_request.demo.private_ip
}
