module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = var.name
  cidr                 = var.cidr
  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true # Single NAT Gateway to reduce costs

  # The VPC must have DNS hostname and DNS resolution support. Otherwise, nodes can’t register to your cluster.
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = var.tags
  


  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1  # to the aws ingress controller public load balancers to be created
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1 # to the aws ingress controller internal load balancers to be created
    # Tags subnets for Karpenter auto-discovery
    "karpenter.sh/discovery" = var.cluster_name
  }
}


