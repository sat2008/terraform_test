module "network" {
  source = "./modules/network"

  env_tag          = var.environment
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  web_subnets      = var.web_subnets
  database_subnets = var.database_subnets
}

module "secrets_kms" {
  source = "./modules/kms"

  alias_name  = "${var.environment}-secrets"
  description = "${var.environment} KMS key for Secrets Manager and RDS secrets"

  tags = {
    Environment = var.environment
    Service     = var.service
  }
}

module "alb" {
  source = "./modules/alb"

  name               = "nginx-alb"
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [aws_security_group.alb-sgrp.id]
  target_group_name  = "nginx-target-group"
}
