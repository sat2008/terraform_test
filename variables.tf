variable "environment" {
  description = "the environment name"
}

variable "service" {
  description = "the service name"
}

variable "profile" {
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "Public subnets keyed by stable names."
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "web_subnets" {
  description = "Private ECS/web subnets keyed by stable names."
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "alb_enable_https" {
  description = "Whether to create an HTTPS listener on the ALB."
  type        = bool
  default     = false
}

variable "database_subnets" {
  description = "Private database subnets keyed by stable names."
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "alb_redirect_http_to_https" {
  description = "Whether HTTP should redirect to HTTPS."
  type        = bool
  default     = false
}

variable "alb_certificate_arn" {
  description = "ACM certificate ARN used by the ALB HTTPS listener."
  type        = string
  default     = null
}

variable "alb_ssl_policy" {
  description = "SSL policy used by the ALB HTTPS listener."
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}


### ecs
variable "ecs_min_capacity" {
  description = "Minimum ECS service desired task count."
  type        = number
}

variable "ecs_max_capacity" {
  description = "Maximum ECS service desired task count."
  type        = number
}

variable "ecs_cpu_target_value" {
  description = "Target average ECS service CPU utilization percentage."
  type        = number
}

variable "ecs_memory_target_value" {
  description = "Target average ECS service memory utilization percentage."
  type        = number
}

variable "ecs_scale_in_cooldown" {
  description = "Cooldown in seconds before scaling in."
  type        = number
}

variable "ecs_scale_out_cooldown" {
  description = "Cooldown in seconds before scaling out."
  type        = number
}
