resource "aws_ecs_cluster" "name" {
  name = var.project_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}