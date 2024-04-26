variable "tags" {
  type    = string
  default = "sb_by_terraform"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

################################################################################
# VPC
################################################################################
variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = string
  default = "true"
}

variable "enable_dns_support" {
  type    = string
  default = "true"
}

variable "vpc_tag" {
  type    = string
  default = "sb_main_vpc"
}

################################################################################
# SUBNET
################################################################################
variable "count_public_subnet" {
  type    = string
  default = "2"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.10.10.0/24", "10.10.20.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "map_public_ip_on_launch" {
  type    = string
  default = "true"
}

variable "pub_subnet_tag" {
  type    = string
  default = "sb_pub_subnet"
}

#private
variable "count_private_subnet" {
  type = string
  default = "3"
}

variable "priv_subnet_tag" {
  type = string
  default = "sb_priv_subnet"
}

variable "private_subnets" {
  type = list(string)
  default = [ "10.10.11.0/24", "10.10.21.0/24", "10.10.31.0/24" ]
}


################################################################################
# IGW
################################################################################
variable "igw_tag" {
  type = string
  default = "sb_igw"
}


################################################################################
# ROUTE
################################################################################
variable "base_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

variable "pub_route_tag" {
  type = string
  default = "sb_public_route"
}

variable "priv_route_tag" {
  type = string
  default = "sb_private_route"
}

