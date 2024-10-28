# Cria o cluster ECS
resource "aws_ecs_cluster" "main" {
  name = var.project_name

  # Habilita o container insights para monitorar o desempenho dos conteineres.
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = var.capacity_providers

  default_capacity_provider_strategy {
    base = 1
    weight = 100
    capacity_provider = "FARGATE"
  }
}