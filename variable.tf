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

# AMI type
variable "ami_type" {
  description = "AMI type"
  type        = string
  default     = "AL2_x86_64"
}

# instance types
variable "instance_types" {
  description = "Instance types"
  type        = list(string)
  default     = ["t2.medium"]
}

# desired size
variable "desired_size" {
  description = "Desired size"
  type        = number
  default     = 3
}

# max size
variable "max_size" {
  description = "Max size"
  type        = number
  default     = 10
}

# min size
variable "min_size" {
  description = "Min size"
  type        = number
  default     = 3
}

# master
variable "host_os" {
    type = string
    default = "linux"
}

# instance type
variable "master_instance_types" {
  description = "Instance type"
  type        = string
  default     = "t2.medium"
}