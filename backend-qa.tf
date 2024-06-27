# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-backend-bucket-qa"
#     key            = "terraform.tfstate"
#     region         = "us-west-1"
#     dynamodb_table = "terraform-locks-qa"
#     encrypt        = true
#   }
# }
