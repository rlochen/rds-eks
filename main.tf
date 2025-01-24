# Entry point to define the provider and include modules and this calls the required modules (example: rds, network, iam) and passes necessary variables

# Fetch available availability zones for subnet distribution
data "aws_availability_zones" "available" {
  state = "available"
}

# Network Module: Create the VPC and subnets
module "network" {
  source            = "./modules/network"
  vpc_cidr_block    = "10.5.0.0/16" # CIDR block for the RDS VPC
  subnet_count      = 2             # Number of subnets to create
  availability_zones = data.aws_availability_zones.available.names
  tags = {
    Environment = "production"
    Project     = "example-app"
  }
}

# IAM Module: Configure IAM policies for application
module "iam" {
  source               = "./modules/iam"
  application_iam_role = "arn:aws:iam::123456789101:role/application/example-app"
  rds_db_arn           = "arn:aws:rds:ap-southeast-2:123456789101:db:my-database"
  tags = {
    Environment = "production"
    Project     = "example-app"
  }
}


# RDS Module: Create the RDS instance and related resources
module "rds" {
  source                 = "./modules/rds"
  application_iam_role_name = module.iam.iam_role_name
  application_iam_role  = module.iam.iam_role_arn  # Reference the IAM role ARN from the iam module output
  rds_policy_arn            = module.iam.iam_policy_arn
  rds_vpc_id           = module.network.vpc_id  #Pass VPC ID
  rds_subnet_ids  = module.network.subnet_ids  # Pass Subnet IDs
  eks_vpc_cidr         = var.eks_vpc_cidr
  subnet_ids            = module.network.subnet_ids
  rds_master_username  = var.rds_master_username # Pass the master username
  rds_master_password  = var.rds_master_password # Pass the master password
  rds_db_name          = var.rds_db_name
  tags = {
    Environment = "production"
    Project     = "example-app"
  }
}