# Create S3 buckets for each environment with KMS encryption

# Dev Backend Bucket

resource "aws_s3_bucket" "dev-backend" {

   depends_on = [aws_kms_key.dev-key] 
   
  provider = aws.dev-ap-south-1
  
    # Use the 'dev-ap-south-1' provider for the dev environment
  
  bucket   = "dev-tf-backend-00007" 


  lifecycle {
    prevent_destroy = false  # Prevent accidental deletion of the bucket
  }

  tags = {
    Name = "Terraform Backend Bucket - Dev"
  }
}

 resource "aws_s3_bucket_acl" "dev-bucket-acl" {

  bucket = aws_s3_bucket.dev-backend.id
  

  acl    = "private"
}


resource "aws_s3_bucket_versioning" "dev-buacket-versioning" {
  bucket = aws_s3_bucket.dev-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_s3_bucket_server_side_encryption_configuration" "dev-bucket_encryption" {
  bucket = aws_s3_bucket.dev-backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
