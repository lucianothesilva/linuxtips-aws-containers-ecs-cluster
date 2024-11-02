# Cria uma role IAM que será assumida por instâncias EC2, permitindo que elas realizem ações conforme as políticas anexadas.
# Usando roles se garante que as instâncias tem apenas permissões minimas para realizar o que precisam, sem precisar que se criem keys permanentes.
resource "aws_iam_role" "main" {
  name = format("%s-instance-profile", var.project_name)

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Policy para permitir que a instância EC2 interaja com o ECS.
resource "aws_iam_role_policy_attachment" "ec2_role" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

# Policy para permitir que a instância EC2 seja gerenciada pelo AWS Systems Manager (SSM).
resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Cria um perfil de instância IAM que associa a role criada anteriormente às instâncias EC2.
resource "aws_iam_instance_profile" "main" {
  name = format("%s-instance-profile", var.project_name)
  role = aws_iam_role.main.name
}