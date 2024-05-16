variable "region" {
  type    = string
  default = "us-west-2"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "192.168.0.0/16"
}

# Private Subnet CIDR Block
variable "private_subnet_cidr_block" {
  description = "Private Subnet CIDR Block"
  type        = list(string)
  default     = ["192.168.0.0/19", "192.168.32.0/19"]
}

# Public Subnet CIDR Block
variable "public_subnet_cidr_block" {
  description = "Public Subnet CIDR Block"
  type        = list(string)
  default     = ["192.168.64.0/19", "192.168.96.0/19"]
}