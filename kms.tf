# Create KMS keys for each environment
resource "aws_kms_key" "dev-key" {
  provider = aws.dev-ap-south-1  # Use the 'dev-ap-south-1' provider for the dev environment
  description = "KMS key for dev environment"
  deletion_window_in_days = 10
}

resource "aws_kms_key" "qa-key" {
  provider = aws.qa-us-east-1  # Use the 'qa-us-east-1' provider for the QA environment
  description = "KMS key for QA environment"
  deletion_window_in_days = 10
}

resource "aws_kms_key" "prod-key" {
  provider = aws.prod-us-west-1  # Use the 'prod-us-west-1' provider for the prod environment
  description = "KMS key for prod environment"
  deletion_window_in_days = 10
}