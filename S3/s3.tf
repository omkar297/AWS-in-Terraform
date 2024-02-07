resource "aws_s3_bucket" "testawss3bucketpractical" {
  bucket = "testawss3bucketpractical"
   tags = {
     Name = "testawss3bucketpractical"
     env = "test"
   }
}
resource "aws_s3_bucket_lifecycle_configuration" "test-aws_s3_bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.testawss3bucketpractical.id
  rule {
    id = "lod"
    noncurrent_version_expiration {
      noncurrent_days = 360
    }
    expiration {
      days = 180
    }
    filter {
      and {
        prefix = "log/"
        tags = {
          rule = "log"
          auto = "true"
        }
      }
    }
    status = "Enabled"
    transition {
      days = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days = 90
      storage_class = "GLACIER"
    }
  }
}
resource "aws_s3_bucket_versioning" "test-aws_s3_bucket_versioning" {
  bucket = aws_s3_bucket.testawss3bucketpractical.id
  versioning_configuration {
    status = "Enabled"
  }
}