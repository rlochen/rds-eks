# Ouptuts specific to the network module
# Output the VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

# Output the Subnet IDs
output "subnet_ids" {
  description = "The IDs of the subnets created within the VPC"
  value       = aws_subnet.main[*].id
}

# Output the VPC CIDR Block
output "vpc_cidr_block" {
  description = "The CIDR block associated with the VPC"
  value       = aws_vpc.main.cidr_block
}

# Output the Subnet CIDR Blocks
output "subnet_cidr_blocks" {
  description = "The CIDR blocks of the subnets"
  value       = aws_subnet.main[*].cidr_block
}

# Output the Availability Zones of the Subnets
output "availability_zones" {
  description = "The availability zones where the subnets were created"
  value       = aws_subnet.main[*].availability_zone
}
