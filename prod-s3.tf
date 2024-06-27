# /home/afzaal/Documents/Terraform/1. terraform-workspace-seprate-bcukets/s3.tf

# Prod Backend Bucket


resource "aws_s3_bucket" "prod-backend" {
  provider = aws.prod-us-west-1  # Use the 'prod-us-west-1' provider for the prod environment
  bucket   = "prod-tf-backend-00007"
  depends_on = [aws_kms_key.prod-key]

  
  lifecycle {
    prevent_destroy = false  # Prevent accidental deletion of the bucket
  }

  tags = {
    Name = "Terraform Backend Bucket - Prod"
  }
}


resource "aws_s3_bucket_acl" "prod-bucket-acl" {

  bucket = aws_s3_bucket.prod-backend.id
  acl    = "private"
}


resource "aws_s3_bucket_versioning" "prod-buacket-versioning" {
  bucket = aws_s3_bucket.prod-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "prod-bucket_encryption" {
  bucket = aws_s3_bucket.prod-backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
