resource "aws_lambda_function" "lambda" {
    s3_bucket = "new-s3-bucket-tugba"
    s3_key = "lambda.zip"
    function_name = "lambda_s3_kms_sns"
    role = aws_iam_role.lambda_role.arn
    handler = "lambda_function.lambda_handler"
    
    runtime = "python3.8"
    tags = merge(local.common_tags)
    depends_on = [ aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role ]
    environment {
       variables = {
           DST_BUCKET = "new-s3-bucket-tugba",

           REGION = "us-west-1"
       }
   }
}

resource "aws_s3_bucket_notification" "bucket_terraform_notification" {
   bucket = "new-s3-bucket-tugba"
   lambda_function {
       lambda_function_arn = "arn:aws:lambda:us-west-1:371191637464:function:lambda_s3_kms_sns"
       events = ["s3:ObjectCreated:*"]
   }
   depends_on = [ aws_lambda_permission.allow_terraform_bucket ]
}

