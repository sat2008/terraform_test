resource "aws_security_group" "database-sgrp" {
  name        = "sgrp-database"
  description = "Allow inbound traffic from application security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow traffic from application layer"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
