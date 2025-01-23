# outputs for the resources
# Defines the outputs for resources created at the root level (e.g., RDS instance endpoint, subnet IDs)
# Outputs for IAM resources
# VPC ID from the Network module
output "vpc_id" {
  description = "The VPC ID of the created network"
  value       = module.network.vpc_id
}

# Subnet IDs from the Network module
output "subnet_ids" {
  description = "The Subnet IDs of the created network"
  value       = module.network.subnet_ids
}

# Security Group ID for the RDS instance
output "rds_security_group_id" {
  description = "The Security Group ID of the RDS instance"
  value       = module.rds.rds_security_group_id
}

# RDS Database endpoint
output "rds_endpoint" {
  description = "The connection endpoint of the RDS instance"
  value       = module.rds.rds_endpoint
}

# IAM Role ARN for the application
output "iam_role_arn" {
  description = "The ARN of the IAM role assigned to the application"
  value       = module.iam.iam_role_arn
}

# IAM Policy ARN for the RDS connection
output "iam_policy_arn" {
  description = "The ARN of the IAM policy attached for RDS connection"
  value       = module.iam.iam_policy_arn
}
