variable "env_tag" {
  description = "Environment name used for network resource tags."
  type        = string
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

variable "database_subnets" {
  description = "Private database subnets keyed by stable names."
  type = map(object({
    cidr = string
    az   = string
  }))
}
