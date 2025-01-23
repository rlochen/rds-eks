# Variables specific to the network module
# CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

# Number of subnets to create
variable "subnet_count" {
  description = "The number of subnets to create in the VPC"
  type        = number
  default     = 2
}

# Availability zones to use for subnets
variable "availability_zones" {
  description = "List of availability zones to deploy subnets in"
  type        = list(string)
}

# Tags to apply to the network resources
variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}
