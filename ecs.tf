resource "aws_ecs_cluster" "nginx_cluster" {
  name = "${var.environment}-cluster"
}

resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu           = "256"
  memory        = "512"
  task_role_arn = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "nginx-container"
    image = "nginx:latest"
    portMappings = [{
      containerPort = 80,
      hostPort      = 80,
    }]
  }])
}

resource "aws_ecs_service" "nginx_service" {
  name            = "${var.environment}-${var.service}"
  cluster         = aws_ecs_cluster.nginx_cluster.id
  task_definition = aws_ecs_task_definition.nginx_task.arn
  launch_type     = "FARGATE"
   # missing desired_count   for runing the tasks ???
   #desired_count   = 1
  desired_count   = var.ecs_min_capacity
  network_configuration {
    # subnet assignmnets not correct single subnet ALB need both for farget
    subnets = module.network.web_subnet_ids
    security_groups = [aws_security_group.ecs-sgrp.id]
  }

  load_balancer {
    #module added
    # target_group_arn = aws_lb_target_group.nginx_target_group.arn
    target_group_arn = module.alb.target_group_arn
    container_name   = "nginx-container"
    container_port   = 80 # port doesnt match 81
  }

  #depends_on = [aws_ecs_task_definition.nginx_task]
  # ECS service depend on the ALB listener
  # before module changes depends_on = [aws_lb_listener.nginx_listener]
  depends_on = [module.alb]
}
