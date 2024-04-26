locals {
  tags = var.tags
}

module "module" {
  source = "github.com/sibiniiii/terraform-aws-module/network"

  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  vpc_tag              = var.vpc_tag
  tags                 = local.tags


  count_public_subnet     = var.count_public_subnet
  public_subnets          = var.public_subnets
  azs                     = var.azs
  map_public_ip_on_launch = var.map_public_ip_on_launch
  pub_subnet_tag          = var.pub_subnet_tag


  count_private_subnet = var.count_private_subnet
  private_subnets = var.private_subnets
  priv_subnet_tag = var.priv_subnet_tag
  igw_tag = var.igw_tag


  base_cidr_block = var.base_cidr_block
  pub_route_tag = var.pub_route_tag
  priv_route_tag = var.priv_route_tag
}