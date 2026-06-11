variable "name_prefix" {
  description = "Prefix used for autoscaling policy names."
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster."
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service."
  type        = string
}

variable "min_capacity" {
  description = "Minimum ECS service desired task count."
  type        = number
}

variable "max_capacity" {
  description = "Maximum ECS service desired task count."
  type        = number
}

variable "cpu_target_value" {
  description = "Target average ECS service CPU utilization percentage."
  type        = number
}

variable "memory_target_value" {
  description = "Target average ECS service memory utilization percentage."
  type        = number
}

variable "scale_in_cooldown" {
  description = "Cooldown in seconds before scaling in."
  type        = number
}

variable "scale_out_cooldown" {
  description = "Cooldown in seconds before scaling out."
  type        = number
}
