# Provide values for the input variables in variables.tf
# VPCs
eks_vpc_cidr        = "10.2.0.0/16"  # CIDR block for the EKS cluster VPC
rds_vpc_cidr        = "10.5.0.0/16"  # CIDR block for the RDS cluster VPC

# Subnet IDs for RDS
rds_private_subnets = [
  "subnet-0a1b2c3d4e5f67890",  # private subnet 1
  "subnet-1a2b3c4d5e6f78901"   # private subnet 2
]

# RDS Instance Configuration
rds_allocated_storage = 100                   # Allocated storage in GB
rds_storage_type      = "gp3"                 # Cost-effective storage type
rds_instance_class    = "db.m5.large"         # Instance type
rds_engine            = "postgres"            # Database engine
rds_engine_version    = "13.3"                # Engine version for PostgreSQL
rds_db_name           = "exampledb"           # Database name
rds_master_username   = "admin"               # Master username for the database
rds_master_password   = "J)35/ykI~04V"        # Master password
rds_multi_az          = false                 # Single AZ deployment
rds_backup_retention  = 7                     # Backup retention period in days
rds_iops              = 13000                 # IOPS for the RDS instance

# IAM Role and Policy for Application
application_iam_role_arn = "arn:aws:iam::123456789101:role/application/example-app"
