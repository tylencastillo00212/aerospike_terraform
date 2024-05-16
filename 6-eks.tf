# IAM role for eks
resource "aws_iam_role" "aerospike_demo" {
  name = "eks-cluster-aerospike_demo"
  tags = {
    tag-key = "eks-cluster-aerospike_demo"
  }

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

# eks policy attachment
resource "aws_iam_role_policy_attachment" "aerospike_demo-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.aerospike_demo.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# bare minimum requirement of eks
resource "aws_eks_cluster" "aerospike_demo" {
  name     = "aerospike_demo"
  role_arn = aws_iam_role.aerospike_demo.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-region-a.id,
      aws_subnet.private-region-b.id,
      aws_subnet.public-region-a.id,
      aws_subnet.public-region-b.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [aws_iam_role_policy_attachment.aerospike_demo-AmazonEKSClusterPolicy]
}