# Variables specific to the RDS module
variable "rds_vpc_id" {
  description = "The VPC ID where the RDS instance will be deployed."
  type        = string
}

variable "eks_vpc_cidr" {
  description = "CIDR block of the EKS VPC to allow ingress traffic from."
  type        = string
}

variable "rds_subnet_ids" {
  description = "List of subnet IDs for RDS deployment."
  type        = list(string)
}

variable "rds_allocated_storage" {
  description = "The allocated storage (in GB) for the RDS instance."
  type        = number
  default     = 100
}

variable "rds_storage_type" {
  description = "The storage type for the RDS instance (e.g., gp3)."
  type        = string
  default     = "gp3"
}

variable "rds_instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.m5.large"
}

variable "rds_engine" {
  description = "The database engine (e.g., postgres)."
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "The version of the RDS engine (e.g., 13.3 for PostgreSQL)."
  type        = string
  default     = "13.3"
}

variable "rds_db_name" {
  description = "The name of the RDS database."
  type        = string
}

variable "rds_master_username" {
  description = "The master username for the RDS instance."
  type        = string
}

variable "rds_master_password" {
  description = "The master password for the RDS instance."
  type        = string
  sensitive   = true
}

variable "rds_multi_az" {
  description = "Whether the RDS instance should be deployed in multiple AZs."
  type        = bool
  default     = false
}

variable "rds_backup_retention" {
  description = "The backup retention period for the RDS instance (in days)."
  type        = number
  default     = 7
}

variable "rds_iops" {
  description = "The number of IOPS for the RDS instance (if applicable)."
  type        = number
  default     = 13000
}

variable "subnet_ids" {
  description = "The subnet IDs for the RDS instance"
  type        = list(string)
}

variable "application_iam_role" {
  description = "The IAM role ARN for the application accessing the database"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to RDS resources"
  type        = map(string)
  default     = {}
}