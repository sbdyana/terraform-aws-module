output "sb-main-vpc" {
  description = "sb_main_vpc"
  value = aws_vpc.sb_main_vpc
}

output "sb-main-vpc-id" {
  description = "sb_main_vpc_id"
  value = aws_vpc.sb_main_vpc.id
}

output "sb-mian-vpc-cidr-block" {
  description = "sb_main_vpc_cidr"
  value = aws_vpc.sb_main_vpc.cidr_block
}

output "public_subnet" {
    value = aws_subnet.public_subnet[*].id
}

output "private_subnet" {
  value = aws_subnet.private_subnet[*].id
}

output "public_route" {
  value = aws_route_table.pub_route
}

output "igw" {
  value = aws_internet_gateway.igw.id
}