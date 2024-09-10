# Security group especifico para o load balancer
resource "aws_security_group" "lb" {
  name   = format("%s-load-balancer", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "Libera trafego porta 80"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

# load balancer
resource "aws_lb" "main" {
  name = "ecs-cluster-ingress"
  # name             = format("%s-ingress", var.project_name) alterado devido a limitação tamanho do nome do projeto
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [
    data.aws_ssm_parameter.pub_subnet_1a.value,
    data.aws_ssm_parameter.pub_subnet_1b.value,
    data.aws_ssm_parameter.pub_subnet_1c.value
  ]

  security_groups = [
    aws_security_group.lb.id
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false

}

# Listener que define como o load balancer deve lidar com o tráfego de entrada.
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "TesteLu"
      status_code  = "200"
    }
  }
}

