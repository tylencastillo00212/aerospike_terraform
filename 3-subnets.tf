# private subnet 01
resource "aws_subnet" "private-region-a" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = "192.168.0.0/19"
  availability_zone = "${var.region}a"

  tags = {
    Name                              = "private-region-a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

# private subnet 02
resource "aws_subnet" "private-region-b" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = "192.168.32.0/19"
  availability_zone = "${var.region}b"

  tags = {
    Name                              = "private-region-b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

# public subnet 01
resource "aws_subnet" "public-region-a" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = "192.168.64.0/19"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name                         = "public-region-a"
    "kubernetes.io/role/elb"     = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/demo" = "owned"
  }
}

# public subnet 02
resource "aws_subnet" "public-region-b" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = "192.168.96.0/19"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name                         = "public-region-b"
    "kubernetes.io/role/elb"     = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/demo" = "owned"
  }
}