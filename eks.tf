resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
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

