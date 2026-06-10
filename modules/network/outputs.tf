output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = [for key in sort(keys(aws_subnet.public)) : aws_subnet.public[key].id]
}

output "public_subnet_ids_by_name" {
  description = "IDs of the public subnets keyed by name."
  value       = { for key, subnet in aws_subnet.public : key => subnet.id }
}

output "web_subnet_ids" {
  description = "IDs of the private ECS/web subnets."
  value       = [for key in sort(keys(aws_subnet.web)) : aws_subnet.web[key].id]
}

output "web_subnet_ids_by_name" {
  description = "IDs of the private ECS/web subnets keyed by name."
  value       = { for key, subnet in aws_subnet.web : key => subnet.id }
}

output "database_subnet_ids" {
  description = "IDs of the private database subnets."
  value       = [for key in sort(keys(aws_subnet.database)) : aws_subnet.database[key].id]
}

output "database_subnet_ids_by_name" {
  description = "IDs of the private database subnets keyed by name."
  value       = { for key, subnet in aws_subnet.database : key => subnet.id }
}

output "internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway."
  value       = aws_nat_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}

output "web_route_table_id" {
  description = "ID of the private web route table."
  value       = aws_route_table.web.id
}
