# VPC Configuration
variable "eks_vpc_cidr" {
  description = "The CIDR block for the EKS VPC"
  type        = string
}

variable "rds_vpc_cidr" {
  description = "The CIDR block for the RDS VPC"
  type        = string
}

variable "rds_private_subnets" {
  description = "List of private subnets for the RDS instance"
  type        = list(string)
}

# RDS Instance Configuration
variable "rds_allocated_storage" {
  description = "The allocated storage in GB for the RDS instance"
  type        = number
  default     = 100
}

variable "rds_storage_type" {
  description = "The storage type for the RDS instance (gp2, gp3, io1, etc.)"
  type        = string
  default     = "gp3"
}

variable "rds_instance_class" {
  description = "The instance type for the RDS instance"
  type        = string
  default     = "db.m5.large"
}

variable "rds_engine" {
  description = "The database engine for the RDS instance (e.g., postgres, mysql)"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "13.3"
}

variable "rds_db_name" {
  description = "The name of the initial database"
  type        = string
}

variable "rds_master_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "rds_master_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "rds_multi_az" {
  description = "Whether to enable Multi-AZ for the RDS instance"
  type        = bool
  default     = false
}

variable "rds_backup_retention" {
  description = "The number of days to retain backups for the RDS instance"
  type        = number
  default     = 7
}

variable "rds_iops" {
  description = "The number of IOPS for the RDS instance"
  type        = number
  default     = 13000
}

# IAM Configuration
variable "application_iam_role_arn" {
  description = "The ARN of the IAM role assumed by the application"
  type        = string
}

# Tagging
variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "example-project"
  }
}
