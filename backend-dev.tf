# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-backend-bucket-dev"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks-dev"
#     encrypt        = true
#   }
# }
