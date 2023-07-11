resource "aws_iam_instance_profile" "iam_profile" {
  name = "iam_profile"
  role = aws_iam_role.terraform_role.id
}

resource "aws_iam_role" "terraform_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = merge(
    local.common_tags,
    {
      "Name" = "terraform_iam_role"
    }
  )
}

resource "aws_iam_policy" "terraform_iam_policy" {
  name = "tugba-terraform-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "AllowFullAccess",
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = "*",

      }
    ]
  })
}
resource "aws_iam_policy_attachment" "terraform_iam_policy_attachment" {
  name       = "terraform_iam_policy_attachment"
  roles      = [aws_iam_role.terraform_role.id]
  policy_arn = aws_iam_policy.terraform_iam_policy.arn

}
