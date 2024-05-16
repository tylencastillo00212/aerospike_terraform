# Create a VPC
resource "aws_vpc" "k8svpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "k8svpc"
  }
}