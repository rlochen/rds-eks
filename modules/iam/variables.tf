# variables specific to the IAM module
# Application IAM Role
variable "application_iam_role" {
  description = "The IAM Role ARN assumed by the application for accessing AWS services"
  type        = string
}

# RDS Database Resource ARN
variable "rds_db_arn" {
  description = "The ARN of the RDS database for granting permissions"
  type        = string
}

# Tags for IAM resources
variable "tags" {
  description = "A map of tags to assign to IAM resources"
  type        = map(string)
  default     = {}
}
