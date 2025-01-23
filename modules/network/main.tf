# VPC and subnet creation
# Create the VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = merge(
    var.tags,
    {
      Name = "data-vpc"
    }
  )
}

# Data source to fetch availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create subnets
resource "aws_subnet" "main" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
    {
      Name = "data-subnet-${count.index}"
    }
  )
}
