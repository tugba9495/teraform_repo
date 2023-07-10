data "aws_iam_policy_document" "terraform_iam_policy_document" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = ["*"]

  }
  statement {
    sid       = "AllowFullAccess"
    actions   = ["sts:AssumeRole"]
    resources = ["*"]
  }


}