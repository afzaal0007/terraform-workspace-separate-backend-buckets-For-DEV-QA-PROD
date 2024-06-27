# Output the bucket names for each environment
output "dev-backend-bucket-name" {
  value = aws_s3_bucket.dev-backend.bucket
}

output "qa-backend-bucket-name" {
  value = aws_s3_bucket.qa-backend.bucket
}

output "prod-backend-bucket-name" {
  value = aws_s3_bucket.prod-backend.bucket
}
