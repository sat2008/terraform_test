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
