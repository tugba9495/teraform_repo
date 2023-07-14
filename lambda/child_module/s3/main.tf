resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.aws_s3_bucket_name
  
  tags   = merge(local.common_tags)
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    =  "lambda.zip"
  source = "/Users/tugbayildirim/desktop/teraform_repo/lambda/root_module/ss3-kms-lambda-sns/python_folder/lambda.zip"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  

  versioning_configuration {
    status = var.bucket_versioning_configuration
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_acl" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_metric" "s3_bucket_metric" {
  bucket = aws_s3_bucket.s3_bucket.id
  name   = "EntireBucket"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "new-bucket-tugba-for-bucket-logging"
}

resource "aws_s3_bucket_logging" "s3_logging" {
  bucket        = aws_s3_bucket.s3_bucket.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.log_bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowLogDelivery",
        "Effect": "Allow",
        "Principal": { "Service": "delivery.logs.amazonaws.com" },
        "Action": "s3:PutObject",
        "Resource": "${aws_s3_bucket.log_bucket.arn}/log/*"
      }
    ]
  })
}
resource "aws_s3_bucket_policy" "s3_policy_for_new-s3-bucket-tugba" {
    bucket = aws_s3_bucket.s3_bucket.id
    policy = data.aws_iam_policy_document.state_policy_document.json

  
  
}
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_sse_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     =  "aws:kms"
      
    }
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id     = "expire-current-objects"
    status = "Enabled"

    filter {
      prefix = "log/"
    }

    expiration {
      days = 90
    }
  }

  rule {
    id     = "export-non-current-objects"
    status = "Enabled"

    filter {
      prefix = "tmp/"
    }

    noncurrent_version_expiration {
      noncurrent_days = 14
    }

    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }

  rule {
    id     = "delete-incomplete-uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  rule {
    id     = "transition-objects-logs"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    transition {
      days          = 60
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
