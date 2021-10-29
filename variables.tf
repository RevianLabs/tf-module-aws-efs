variable "tags" {
  type        = map(string)
  description = "The tags associated to the efs resource."
  default     = {}
}

variable "token_name" {
  type        = string
  description = "The name used for token creation"
  default = ""
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to associate with EFS"
}

variable "security_group_ingress_protocol" {
    type = string
    default = "tcp"
}

variable "enable_encryption" {
    type = bool
    default = true
}

variable "performance_mode" {
    type = string
    default = "generalPurpose"
}

variable "throughput_mode" {
    type = string
    default = "bursting"
}

variable "security_ids" {
    type = list
    default = []
}
