resource "aws_s3_bucket" "bucket" {
    bucket = var.bucketname
     object_lock_enabled = true
    # object_lock_configuration {
    #  
    # }
    
    tags = {
        Name = "${var.aws_projectname}terraformstatestore"
    }

    
}

# resource "aws_s3_bucket_object_lock_configuration" "example" {
#   bucket = aws_s3_bucket.example.id

#   rule {
#     default_retention {
#       mode = "COMPLIANCE"
#       days = 5
#     }
#   }
# }

# resource "aws_s3_bucket_versioning" "s3versioning" {
#   bucket = aws_s3_bucket.bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }


# resource "aws_s3_bucket_server_side_encryption_configuration" "awss3encryption" {
#   bucket = aws_s3_bucket.bucket.id
#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.mykmsbucketkey.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }

# resource "aws_kms_key" "mykmsbucketkey" {
#   description             = "This key is used to encrypt bucket objects"
# }


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}