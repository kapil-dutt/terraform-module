variable "vpc_name" {
  description = "Name of the VPC."
  type        = string

  validation {
    condition     = length(var.vpc_name) >= 3 && length(var.vpc_name) <= 63
    error_message = "VPC name must be between 3 and 63 characters."
  }
}

variable "cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for the subnets."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "create_igw" {
  description = "Whether to create an Internet Gateway and public routes."
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT Gateway resources for private subnet internet egress."
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Whether to create a single shared NAT Gateway instead of one per private subnet/AZ."
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Whether to create one NAT Gateway per availability zone. Set single_nat_gateway to false when enabling this."
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Whether instances launched in public subnets should receive public IPs by default."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether DNS resolution is supported for the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled for the VPC."
  type        = bool
  default     = true
}

variable "manage_default_security_group" {
  description = "Whether to manage the default security group created with the VPC."
  type        = bool
  default     = true
}

variable "enable_flow_log" {
  description = "Whether to enable VPC Flow Logs."
  type        = bool
  default     = false
}

variable "create_flow_log_cloudwatch_log_group" {
  description = "Whether to create a CloudWatch Log Group for VPC Flow Logs."
  type        = bool
  default     = true
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create an IAM role for publishing VPC Flow Logs to CloudWatch Logs."
  type        = bool
  default     = true
}

variable "flow_log_traffic_type" {
  description = "Type of traffic to capture in VPC Flow Logs. Valid values are ACCEPT, REJECT, or ALL."
  type        = string
  default     = "ALL"

  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_log_traffic_type)
    error_message = "Flow log traffic type must be one of ACCEPT, REJECT, or ALL."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Module    = "vpc"
  }
}
