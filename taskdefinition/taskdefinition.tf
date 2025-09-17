resource "aws_ecs_task_definition" "react-app-td" {
  family                   = "react-app-td"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "react-app"
      image     = "779846799257.dkr.ecr.us-east-1.amazonaws.com/react-app-repo:latest"
      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      # CloudWatch Logs config
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/react-app"
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

# Create CloudWatch Log Group (optional but recommended)
resource "aws_cloudwatch_log_group" "ecs_react_app" {
  name              = "/ecs/react-app"
  retention_in_days = 7
}
