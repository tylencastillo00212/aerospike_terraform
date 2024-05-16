# private subnet 01
resource "aws_subnet" "private-region-a" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = var.private_subnet_cidr_block[0]
  availability_zone = "${var.region}a"

  tags = {
    Name                                   = "private-region-a"
    "kubernetes.io/role/internal-elb"      = "1"
    "kubernetes.io/cluster/aerospike_demo" = "owned"
  }
}

# private subnet 02
resource "aws_subnet" "private-region-b" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = var.private_subnet_cidr_block[1]
  availability_zone = "${var.region}b"

  tags = {
    Name                                   = "private-region-b"
    "kubernetes.io/role/internal-elb"      = "1"
    "kubernetes.io/cluster/aerospike_demo" = "owned"
  }
}

# public subnet 01
resource "aws_subnet" "public-region-a" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = var.public_subnet_cidr_block[0]
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name                                   = "public-region-a"
    "kubernetes.io/role/elb"               = "1"
    "kubernetes.io/cluster/aerospike_demo" = "owned"
  }
}

# public subnet 02
resource "aws_subnet" "public-region-b" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = var.public_subnet_cidr_block[1]
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name                                   = "public-region-b"
    "kubernetes.io/role/elb"               = "1"
    "kubernetes.io/cluster/aerospike_demo" = "owned"
  }
}