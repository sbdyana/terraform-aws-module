################################################################################
# VPC
################################################################################
variable "vpc_cidr_block" {
  type = string
}

variable "enable_dns_hostnames" {
  type = string
}

variable "enable_dns_support" {
  type = string
}
variable "tags" {
  type = string
}

variable "vpc_tag" {
  type = string
}

################################################################################
# PUBLIC SUBNET
################################################################################
variable "count_public_subnet" {
    type = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch" {
  type = string
}

variable "pub_subnet_tag" {
  type = string
}

################################################################################
# PRIVATE SUBNET
################################################################################
variable "count_private_subnet" {
  type = string
}

variable "priv_subnet_tag" {
  type = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default = []
}

################################################################################
# route
################################################################################
variable "pub_route_tag" {
  type = string
}

variable "base_cidr_block" {
  type = string
}

variable "priv_route_tag" {
  type = string
}

################################################################################
# IGW
################################################################################

variable "igw_tag" {
    type = string
}
