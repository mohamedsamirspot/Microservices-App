
#------------------------------general variables as both modules (network and eks) depend on it------------------------------------
variable "cluster_name" {
  type        = string
  default = "my-eks-cluster"
}
#----------------------------------------------------------------------------------------------------------------------------------




module "network" {
  source = "./network"
  cluster_name = var.cluster_name
}
module "eks" {
  source     = "./eks"
  cluster_name = var.cluster_name
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.private_subnet_ids # Use private subnets for worker nodes
  # control_plane_subnet_ids = module.network.public_subnet_ids   # Public subnets for the control plane
}