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