module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.6"

  name = var.vpc_name
  cidr = var.cidr
  azs  = var.azs

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_igw                    = var.create_igw
  enable_nat_gateway            = var.enable_nat_gateway
  single_nat_gateway            = var.single_nat_gateway
  one_nat_gateway_per_az        = var.one_nat_gateway_per_az
  map_public_ip_on_launch       = var.map_public_ip_on_launch
  enable_dns_support            = var.enable_dns_support
  enable_dns_hostnames          = var.enable_dns_hostnames
  manage_default_security_group = var.manage_default_security_group

  enable_flow_log                      = var.enable_flow_log
  create_flow_log_cloudwatch_log_group = var.create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.create_flow_log_cloudwatch_iam_role
  flow_log_traffic_type                = var.flow_log_traffic_type

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
