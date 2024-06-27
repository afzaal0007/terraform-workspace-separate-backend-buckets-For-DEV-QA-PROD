# QA Backend Bucket

resource "aws_s3_bucket" "qa-backend" {

  depends_on = [aws_kms_key.qa-key]

  
  provider = aws.qa-us-east-1  # Use the 'qa-us-east-1' provider for the QA environment
  bucket   = "qa-tf-backend--00007"


  lifecycle {
    prevent_destroy =  false  # Prevent accidental deletion of the bucket
  }

  tags = {
    Name = "Terraform Backend Bucket - QA"
  }
}


resource "aws_s3_bucket_acl" "qa-bucket-acl" {

  bucket = aws_s3_bucket.qa-backend.id
  acl    = "private"
}


resource "aws_s3_bucket_versioning" "qa-buacket-versioning" {
  bucket = aws_s3_bucket.qa-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "qa-bucket_encryption" {
  bucket = aws_s3_bucket.qa-backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
