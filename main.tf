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


