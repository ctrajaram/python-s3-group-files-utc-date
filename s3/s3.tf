resource "aws_s3_bucket" "bucket" {
    bucket = var.bucketname
     object_lock_enabled = true
    tags = {
        Name = "${var.aws_projectname}terraformstatestore"
    }   
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}