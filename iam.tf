data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "example" {
  name               = "eks-cluster-example"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.example.name
}

resource "kubernetes_cluster_role" "admin_role" {
  metadata {
    name = "k8s-admin-role"
    labels = {
      name = "AdminRole"
    }
  }

  rule {
    api_groups = ["", "apps", "batch", "extensions"]
    resources = [
      "pods", "cronjobs", "deployments", "devents", "ingresses",
      "jobs", "pods/attach", "pods/exec", "pods/log", "pods/portfoward",
      "secrets", "services", "nodes"
    ]
    verbs = [
      "get", "list", "watch", "delete", "describe", "patch",
    "update", "create"]
  }

  depends_on = [aws_eks_node_group.cluster_node_group]
}
