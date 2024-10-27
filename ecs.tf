# Cria o cluster ECS
resource "aws_ecs_cluster" "main" {
  name = var.project_name

  # Habilita o container insights para monitorar o desempenho dos conteineres.
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

