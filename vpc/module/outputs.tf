output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "private_route_table_ids" {
  description = "IDs of created private route tables"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "IDs of created public route tables"
  value       = module.vpc.public_route_table_ids
}
