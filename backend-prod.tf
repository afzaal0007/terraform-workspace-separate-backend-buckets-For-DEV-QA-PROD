# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-backend-bucket-prod"
#     key            = "terraform.tfstate"
#     region         = "eu-west-1"
#     dynamodb_table = "terraform-locks-prod"
#     encrypt        = true
#   }
# }
# # 