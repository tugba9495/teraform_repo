resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = "terraform-bucket-homework"
  tags = merge(
    local.common_tags


  )


}
resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_config" {
  bucket = aws_s3_bucket.terraform_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_policy" "terraform_aws_s3_bucket_policy" {
  bucket = aws_s3_bucket.terraform_s3_bucket.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}
