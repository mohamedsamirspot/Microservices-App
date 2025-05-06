terraform {
  required_version = ">= 1.5.0" # Keep the minimum version constraint

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  

  # backend "s3" {
  #   bucket         = "my-terraform-state"      # Replace with your S3 bucket name
  #   key            = "eks-cluster/terraform.tfstate" # Path within the bucket
  #   region         = "us-east-1"              # Region for the S3 bucket
  #   encrypt        = true                     # Enable server-side encryption
  #   dynamodb_table = "terraform-locks"        # DynamoDB table for state locking
  # }
}
