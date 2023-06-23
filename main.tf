provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"  # Replace with the desired module version

  cluster_name    = "your-cluster-name"
  cluster_version = "1.24"  # Replace with a supported EKS version
  vpc_id          = "your-vpc-id"  # Replace with your VPC ID
  subnet_ids      = ["your-subnet-id-1", "your-subnet-id-2"]  # Replace with your subnet IDs

  eks_managed_node_groups        = {
    private_group = {
      desired_capacity = 2
      instance_type    = "t2.micro"  # Replace with your desired worker instance type
    }
  }
}

output "kubeconfig" {
  value = module.eks
}
