

module "s3_kms_key" {
    source = "../../child-module/kms"
    description = "this module creates kms key with iam policy"
    deletion_window_in_days = 10
    enable_key_rotation = true
    is_enabled = true
    kms_key_alias_name = "alias/my_alias_kms_key"
    random_id = 10
    random_string_special = false
    random_upper = true
    random_lenght = 7
  
}


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
      kms_master_key_id = module.s3_kms_key.kms_key_id

      sse_algorithm = "aws:kms"
    }
  }
}
resource "aws_s3_bucket_policy" "terraform_aws_s3_bucket_policy" {
  bucket = aws_s3_bucket.terraform_s3_bucket.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}
