

locals {

# Define local variables to store workspace-specific values
 workspace = terraform.workspace

  # Define a lookup table to map workspace names to S3 bucket names
  bucket         = lookup({
    "dev"  = "terraform-backend-bucket-dev",
    "qa"   = "terraform-backend-bucket-qa",
    "prod" = "terraform-backend-bucket-prod"
  }, local.workspace,"dev")

  # Define region mappings for each workspace
  # dev region = ap-south-1
  # UAT region = us-east-1
  # Prod region = us-west-1
  region = lookup({
    "dev"  = "ap-south-1",
    "qa"   = "us-east-1",
    "prod" = "us-west-1"
  }, local.workspace,"dev")

  # Define DynamoDB table mappings for each workspace
  dynamodb_table = lookup({
    "dev"  = "terraform-locks-dev",
    "qa"   = "terraform-locks-qa",
    "prod" = "terraform-locks-prod"
  }, local.workspace, "dev")
}
