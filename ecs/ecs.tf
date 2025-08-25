# ECS Cluster
resource "aws_ecs_cluster" "react_app_cluster" {
  name = "react-app-cluster"
}

# Attach Fargate providers to cluster
resource "aws_ecs_cluster_capacity_providers" "react_app_cluster_capacity" {
  cluster_name       = aws_ecs_cluster.react_app_cluster.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}
