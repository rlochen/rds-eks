# RDS instance creation
# RDS Security Group
resource "aws_security_group" "rds_security_group" {
  name        = "rds-sec-group"
  description = "Allow secure connections from the EKS application"
  vpc_id      = var.rds_vpc_id  # Reference to the VPC where the RDS resides

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.eks_vpc_cidr]  # Allow connections from the EKS VPC (CIDR block)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

# RDS Custom Parameter Group
resource "aws_db_parameter_group" "rds_custom_param_group" {
  name        = "custom-param-group"
  family      = "postgres13"  # Ensure this matches the RDS engine version
  description = "Custom parameters for RDS instance"

  # Custom parameters for the database engine
  parameter {
    name  = "statement_timeout"
    value = "3600000"  # 1 hour timeout for queries
  }

  parameter {
    name  = "rds.log_retention_period"
    value = "1440"  # Set log retention period to 1440 minutes (24 hours)
  }

  tags = {
    Name = "rds-custom-parameter-group"
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds-subnet-group"
  description = "RDS Subnet Group for deployment in the private subnet"
  subnet_ids  = var.rds_subnet_ids  # Reference to the subnet IDs for RDS

  tags = {
    Name = "rds-subnet-group"
  }
}

# IAM Role for Application to Access RDS Instance
resource "aws_iam_role" "rds_iam_role" {
  name               = "application-rds-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "rds.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })

  tags = {
    Name = "rds-iam-role"
  }
}

# IAM Policy to Allow Database Access (Attach this to the IAM Role)
resource "aws_iam_policy" "rds_iam_policy" {
  name        = "rds-access-policy"
  description = "Policy granting access to RDS instance"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "rds:DescribeDBInstances",
          "rds:Connect"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "rds-access-policy"
  }
}

resource "aws_iam_role_policy_attachment" "rds_policy_attachment" {
  role       = var.application_iam_role_name
  policy_arn = var.rds_policy_arn
}

# RDS Instance
resource "aws_db_instance" "rds_instance" {
  allocated_storage     = var.rds_allocated_storage   # Storage size (GB)
  storage_type          = var.rds_storage_type        # E.g., "gp3" for general purpose SSD
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.name
  instance_class        = var.rds_instance_class
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  engine                = var.rds_engine              # E.g., "postgres"
  engine_version        = var.rds_engine_version      # E.g., "13.3"
  username              = var.rds_master_username     # Master username
  password              = var.rds_master_password     # Master password
  parameter_group_name  = aws_db_parameter_group.rds_custom_param_group.name
  multi_az              = var.rds_multi_az            # Set to false for single AZ deployment
  backup_retention_period = var.rds_backup_retention  # Retention period for backups (days)
  iops                  = var.rds_iops                # Specify IOPS for the instance
  iam_database_authentication_enabled = true          # Enable IAM DB authentication
  tags = {
    Name = "rds-instance"
  }

  # Allow cross-region replication, if needed (optional)
  # replication_source_identifier = "arn:aws:rds:..."
}

# RDS Endpoint Output (for connection purposes)
output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.rds_instance.endpoint
}

# RDS Instance ID Output (for reference)
output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.rds_instance.id
}
