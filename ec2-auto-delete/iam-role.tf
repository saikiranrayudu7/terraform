resource "aws_iam_role" "ec2_self_terminate" {
  name = "ec2-self-terminate-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "allow_terminate" {
  name = "allow-terminate"
  role = aws_iam_role.ec2_self_terminate.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["ec2:TerminateInstances"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-self-terminate-profile"
  role = aws_iam_role.ec2_self_terminate.name
}