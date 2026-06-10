resource "aws_security_group" "alb-sgrp" {
  name        = "sgrp-alb"
  description = "Allow public HTTP traffic to ALB"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "database-sgrp" {
  name        = "sgrp-database"
  description = "Privite route Allow database traffic from ECS only"
  vpc_id      = aws_vpc.vpc.id

  ## Open to full public ????
  # ingress {
  #   description = "Allow traffic from application layer"
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  
    # ecs sg pointed for internal route 
    ingress {
    description     = "PostgreSQL from ECS"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs-sgrp.id]
  }

  egress {
     description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# resource "aws_security_group" "ecs-sgrp" {
#   name        = "sgrp-web-server"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = aws_vpc.vpc.id

#   egress {
#     description = "outbound traffic"
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_security_group" "ecs-sgrp" {
  name        = "sgrp-web-server"
  description = "Allow HTTP traffic from ALB to ECS"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-sgrp.id]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}