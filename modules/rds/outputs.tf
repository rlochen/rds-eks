# Outputs specific to the neRDStwork module
# Output the RDS instance identifier
output "rds_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.rds_instance.id
}

# Output the RDS endpoint
output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.rds_instance.endpoint
}

# Output the RDS port
output "rds_port" {
  description = "The port to connect to the RDS instance"
  value       = aws_db_instance.rds_instance.port
}

# Output the RDS Subnet Group Name
output "rds_subnet_group_name" {
  description = "The name of the RDS subnet group"
  value       = aws_db_subnet_group.rds_subnet_group.name
}

# Output the RDS Security Group ID
output "rds_security_group_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.rds_security_group.id
}

# Output the Parameter Group Name
output "rds_parameter_group_name" {
  description = "The name of the custom RDS parameter group"
  value       = aws_db_parameter_group.rds_custom_param_group.name
}
