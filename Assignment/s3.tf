resource "aws_s3_bucket" "csv_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.csv_bucket.bucket
}
