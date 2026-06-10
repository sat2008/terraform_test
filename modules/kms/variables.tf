variable "alias_name" {
  description = "Alias name for the KMS key without the alias/ prefix."
  type        = string
}

variable "description" {
  description = "Description for the KMS key."
  type        = string
}

variable "deletion_window_in_days" {
  description = "Waiting period before deleting the KMS key."
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Whether to enable automatic KMS key rotation."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the KMS key."
  type        = map(string)
  default     = {}
}
