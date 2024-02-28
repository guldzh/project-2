module "eks-kubeconfig" {
  source  = "hyperbadger/eks-kubeconfig/aws"
  version = "2.0.0"
  cluster_name = "eks"
  depends_on = [
    aws_eks_cluster.eks                                                                                                                            
    aws_eks_node_group.nodes_general
  ]
}

