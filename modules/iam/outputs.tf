# Outputs specific to the IAM module
# Output the IAM Role ARN
output "iam_role_arn" {
  description = "The ARN of the IAM role assigned to the application"
  value       = aws_iam_role.application_iam_role.arn
}

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.application_iam_role.name
}

# Output the IAM Policy ARN
output "iam_policy_arn" {
  description = "The ARN of the IAM policy that allows RDS connection"
  value       = aws_iam_policy.allow_rds_connect.arn
}

# Output the IAM Policy Name
output "iam_policy_name" {
  description = "The name of the IAM policy created"
  value       = aws_iam_policy.allow_rds_connect.name
}
