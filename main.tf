resource "awes_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state"
  # prevent accidental deletion of this s3
  lifecycle {
    prevent_destroy = true
  }
} 


resource "aws_s3_bucket_versioning" "enabled" {
  bucket = awes_s3_bucket.terraform_state.id 
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption-configuration" "defualt" {
  bucket = awes_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      ssl_algorithm = "AES256"
    }
  }
}



resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = awes_s3_bucket.terraform_state.id
  block_public_policy = true
  block_public_acls = true
  ignore_public_acls = true
  restrict_public_buckets = true
}


resource "aws_dynamodb_table" "terraform_locks" {
  name = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
    }
  }



  
