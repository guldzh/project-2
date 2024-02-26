resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.example.arn
  node_group_name      = "workers"
  node_group_desired_capacity = 1
  node_group_instance_type   = "t3.medium"

  vpc_config {
    subnet_ids = [aws_subnet.private_subnets1.id, aws_subnet.private_subnets2.id,aws_subnet.private_subnets3.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_addon" "cni" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "csi" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name   = "aws-ebs-csi-driver"
}

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

