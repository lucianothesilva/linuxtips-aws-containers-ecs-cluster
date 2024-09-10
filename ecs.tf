# Cria o cluster ECS
resource "aws_ecs_cluster" "main" {
  name = var.project_name

  # Habilita o container insights para monitorar o desempenho dos conteineres.
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# Associa os capacity providers das instancias ao cluster. Sobre capacity providers ver README.
resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name
  capacity_providers = [
    aws_ecs_capacity_provider.on_demand.name,
    aws_ecs_capacity_provider.spots.name
  ]

  # Define a estratégia padrão de Capacity Provider para o cluster, neste caso, as instâncias on-demand são priorizadas com peso 100.
  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.on_demand.name
    weight            = 100
    base              = 0
  }
}