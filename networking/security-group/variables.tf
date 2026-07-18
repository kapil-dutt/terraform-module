variable "name" {
  description = "Name of the security group."
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 255
    error_message = "Security group name must be between 3 and 255 characters."
  }
}

variable "description" {
  description = "Description of the security group."
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created."
  type        = string
}

variable "ingress_rules" {
  description = "Map of ingress rules to add to the security group."
  type        = any
  default     = {}

}

variable "egress_rules" {
  description = "Map of egress rules to add to the security group."
  type        = any
  default = {
    all_outbound = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  }

}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix and append a generated suffix."
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment name (dev/staging/prod)."
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Module    = "security-group"
  }
}
