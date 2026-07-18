output "security_group_id" {
  description = "ID of the security group."
  value       = module.security_group.id
}

output "security_group_arn" {
  description = "ARN of the security group."
  value       = module.security_group.arn
}

output "security_group_name" {
  description = "Name of the security group."
  value       = module.security_group.name
}

output "security_group_owner_id" {
  description = "Owner ID of the security group."
  value       = module.security_group.owner_id
}

output "vpc_id" {
  description = "ID of the VPC where the security group exists."
  value       = module.security_group.vpc_id
}
