resource "aws_s3_bucket" "terra-state-file" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
    env = "test-jenkins"
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "test-aws_s3_bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.terra-state-file.id
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
resource "aws_s3_bucket_versioning" "terra-state-file-versioning-configuration" {
  bucket = aws_s3_bucket.terra-state-file.id
  versioning_configuration {
    status = "Enabled"
  }
}