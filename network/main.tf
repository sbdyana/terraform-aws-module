#기본 10.10.0.0/16 vpc 생성
resource "aws_vpc" "sb_main_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = var.vpc_tag,
    tag = var.tags
  }
}

resource "aws_subnet" "public_subnet" {
  count = var.count_public_subnet
  vpc_id = var.vpc_id
  #cidr_block = element(concat(var.public_subnets), count.index)
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.pub_subnet_tag}_${count.index +1}",
    tag = var.tags
  }
}

resource "aws_subnet" "private_subnet" {
  count = var.count_private_subnet
  vpc_id = var.vpc_id
  #cidr_block = element(concat(var.public_subnets), count.index)
  cidr_block = element(var.private_subnets, count.index)
  availability_zone = element(var.azs,count.index)

  tags = {
    Name = "${var.priv_subnet_tag}_${count.index+1}",
    tag = var.tags
  }
}


resource "aws_route_table" "pub_route" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.base_cidr_block
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.pub_route_tag,
    tag = var.tags
  }
}


resource "aws_route_table_association" "route_table_association_public" {
  count = var.count_public_subnet
  subnet_id = var.public_subnet[count.index]
  route_table_id = aws_route_table.pub_route.id
}

#private
resource "aws_route_table" "priv_route" {
  vpc_id = var.vpc_id

  count = var.count_private_subnet
  route {
    cidr_block = var.vpc_cidr_block
    gateway_id = "local"
  }

  tags = {
    Name = "${var.priv_route_tag}_${count.index+1}",
    tag = var.tags
  }
}

resource "aws_route_table_association" "route_table_association_private" {
  count = var.count_private_subnet
  subnet_id = var.private_subnet[count.index]
  route_table_id = aws_route_table.priv_route[count.index].id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_tag,
    igw_tag = var.tags
  }
}