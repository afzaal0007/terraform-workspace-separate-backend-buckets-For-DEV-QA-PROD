# Create DynamoDB tables for state locking in each environment

resource "aws_dynamodb_table" "dev-locks" {
  provider = aws.dev-ap-south-1  # Use the 'dev-ap-south-1' provider for the dev environment
  name     = "terraform-locks-dev"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_dynamodb_table" "qa-locks" {
  provider = aws.qa-us-east-1  # Use the 'qa-us-east-1' provider for the QA environment
  name     = "terraform-locks-qa"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_dynamodb_table" "prod-locks" {
  provider = aws.prod-us-west-1  # Use the 'prod-us-west-1' provider for the prod environment
  name     = "terraform-locks-prod"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}