data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3-kms-key-policy-for-encryption" {
  statement {
    sid = "Enable IAM User Permissions"

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::371191637464:user/tugba1"]
    }
  }
}

  