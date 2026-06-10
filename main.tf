
module "network" {
  source = "./modules/network"

  env_tag          = var.environment
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  web_subnets      = var.web_subnets
  database_subnets = var.database_subnets
}


resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.id
  engine                 = "postgres"
  engine_version         = "13" #"postgres13" wrong format 
  instance_class         = "db.t2.micro"
  multi_az               = true
  #name                   = "mydb"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sgrp.id]
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "main"
  subnet_ids = module.network.database_subnet_ids
  # module replacment
  # subnet_ids = [aws_subnet.database-1.id, aws_subnet.database-2.id]
  # pointing to wrong subnet 
  #subnet_ids = [aws_subnet.public-1.id, aws_subnet.public-2.id]

}
