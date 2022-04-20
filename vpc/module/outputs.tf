output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of created subnets"
  value       = aws_subnet.subnets.*.id
}

output "default_route_table_id" {
  description = "ID of the default routing table for the VPC"
  value       = module.vpc.default_route_table_id
}
