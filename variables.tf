variable "region" {}

variable "project_name" {}

variable "ssm_vpc_id" {}

#--------- SSM ---------#
variable "ssm_public_subnet_1" {}

variable "ssm_public_subnet_2" {}

variable "ssm_public_subnet_3" {}

variable "ssm_private_subnet_1" {}

variable "ssm_private_subnet_2" {}

variable "ssm_private_subnet_3" {}

#---------Load Balancer ---------#

variable "load_balancer_internal" {}

variable "load_balancer_type" {}

#--------- ECS ----------#
variable "nodes_ami" {}

variable "node_instance_type" {}

variable "node_volume_size" {}

variable "node_volume_type" {}

#--------- ECS Capacity ---------#
variable "cluster_on_demand_min_size" {}

variable "cluster_on_demand_max_size" {}

variable "cluster_on_demand_desired_size" {}

variable "cluster_spot_min_size" {}

variable "cluster_spot_max_size" {}

variable "cluster_spot_desired_size" {}

variable "capacity_providers" {
  type = list
  default = [
    "FARGATE", "FARGATE_SPOT"
  ]
}