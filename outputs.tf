output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.module.public_subnet[*]
}