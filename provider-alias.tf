
# dev region = ap-south-1
# QA region = us-east-1
# Prod region = us-west-1

# Configure AWS providers for different environments
provider "aws" {
  alias  = "dev-ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "qa-us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "prod-us-west-1"
  region = "us-west-1"
}
