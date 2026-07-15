output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "IDs of the private subnets."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "IDs of the public subnets."
  value       = module.vpc.public_subnets
}

output "private_route_table_ids" {
  description = "IDs of the private route tables."
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "IDs of the public route tables."
  value       = module.vpc.public_route_table_ids
}

output "igw_id" {
  description = "ID of the Internet Gateway."
  value       = module.vpc.igw_id
}

output "natgw_ids" {
  description = "IDs of the NAT Gateways."
  value       = module.vpc.natgw_ids
}

output "nat_public_ips" {
  description = "Public Elastic IPs of the NAT Gateways."
  value       = module.vpc.nat_public_ips
}

output "default_security_group_id" {
  description = "ID of the default security group created with the VPC."
  value       = module.vpc.default_security_group_id
}

output "vpc_flow_log_id" {
  description = "ID of the VPC Flow Log resource."
  value       = module.vpc.vpc_flow_log_id
}
