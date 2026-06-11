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

  name               = "${var.environment}-${var.service}-alb"
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [aws_security_group.alb-sgrp.id]

  internal                         = false
  enable_deletion_protection       = false
  enable_http2                     = true
  enable_cross_zone_load_balancing = true

  listener_port     = 80
  listener_protocol = "HTTP"

  target_group_name     = "${var.environment}-${var.service}-tg"
  target_group_port     = 80
  target_group_protocol = "HTTP"
  target_type           = "ip"

  health_check_path                = "/"
  health_check_matcher             = "200"
  health_check_interval            = 30
  health_check_timeout             = 5
  health_check_healthy_threshold   = 3
  health_check_unhealthy_threshold = 2

  tags = {
    Environment = var.environment
    Service     = var.service
    ManagedBy   = "terraform"
  }
}