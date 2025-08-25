resource "aws_ecr_repository" "react-app-repo" {
  name                 = "react-app-repo"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}
