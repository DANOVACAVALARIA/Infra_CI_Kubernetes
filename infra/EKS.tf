module "eks" {
  source = "terraform-aws-modules/eks/aws"

  name                    = var.cluster_name
  kubernetes_version      = "1.31"
  endpoint_public_access  = true

  # Desabilita o EKS Auto Mode (não usado aqui, pois já definimos
  # eks_managed_node_groups manualmente abaixo)
  compute_config = {
    enabled = false
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    alura = {
      min_size     = 1
      max_size     = 10
      desired_size = 3
      vpc_security_group_ids = [aws_security_group.ssh_cluster.id]
      instance_types = ["t2.micro"]
    }
  }
}