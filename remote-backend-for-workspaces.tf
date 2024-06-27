# /home/afzaal/Documents/Terraform/1. terraform-workspace-seprate-bcukets/remote-backend-for-workspaces.tf

# Configure Terraform to use a remote backend for state management
terraform {
  # Specify the minimum required Terraform version
  required_version = ">= 0.13"

  # Configure the S3 backend for remote state storage
  # backend "s3" {
  #   # Specify the S3 bucket to store the state file
  #   bucket         = local.bucket

  #   # Specify the key within the bucket for the state file
  #   key            = "terraform.tfstate"

  #   # Specify the AWS region for the S3 bucket
  #   region         = local.region

  #   # Specify the DynamoDB table for state locking
  #   dynamodb_table = local.dynamodb_table

  #   # Enable encryption for the state file
  #   encrypt        = true
  # }
}

