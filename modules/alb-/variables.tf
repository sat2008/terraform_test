variable "name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "environment" {
  description = "Environment name used for tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the target group is created."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs where the ALB is deployed."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs attached to the ALB."
  type        = list(string)
}

variable "internal" {
  description = "Whether the ALB is internal."
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Whether deletion protection is enabled for the ALB."
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "Whether HTTP/2 is enabled for the ALB."
  type        = bool
  default     = true
}

variable "enable_cross_zone_load_balancing" {
  description = "Whether cross-zone load balancing is enabled."
  type        = bool
  default     = true
}

variable "listener_port" {
  description = "Port for the HTTP listener."
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the HTTP listener."
  type        = string
  default     = "HTTP"
}

variable "target_group_name" {
  description = "Name of the target group."
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group."
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group."
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Target type for the target group. Use ip for Fargate."
  type        = string
  default     = "ip"
}

variable "health_check_path" {
  description = "Health check path for the target group."
  type        = string
  default     = "/"
}

variable "health_check_healthy_threshold" {
  description = "Number of successful health checks before a target is healthy."
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "Number of failed health checks before a target is unhealthy."
  type        = number
  default     = 2
}

variable "health_check_timeout" {
  description = "Health check timeout in seconds."
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "Health check interval in seconds."
  type        = number
  default     = 30
}

variable "health_check_matcher" {
  description = "HTTP status code matcher for successful health checks."
  type        = string
  default     = "200"
}

variable "tags" {
  description = "Tags applied to ALB resources."
  type        = map(string)
  default     = {}
}
