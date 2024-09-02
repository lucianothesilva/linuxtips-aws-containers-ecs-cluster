data "aws_ssm_parameter" "vpc" {
  name = var.ssm_vpc_id
}

data "aws_ssm_parameter" "pub_subnet_1a" {
  name = var.ssm_pub_subnet_1
}

data "aws_ssm_parameter" "pub_subnet_1b" {
  name = var.ssm_pub_subnet_2
}

data "aws_ssm_parameter" "pub_subnet_1c" {
  name = var.ssm_pub_subnet_3
}

data "aws_ssm_parameter" "priv_subnet_1a" {
  name = var.ssm_priv_subnet_1
}

data "aws_ssm_parameter" "priv_subnet_1b" {
  name = var.ssm_priv_subnet_2
}

data "aws_ssm_parameter" "priv_subnet_1c" {
  name = var.ssm_priv_subnet_3
}

