resource "aws_sns_topic" "sns_topic" {
  name = "lambda_s3_sns"
  kms_master_key_id =  var.sns_key_id            #module.s3_kms_key.aws_kms_key give module name and output of kms key id
  
  }

output "sns_topic_arn" {
  value = aws_sns_topic.sns_topic
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "tuba_7655@icloud.com"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "new-s3-bucket-tugba"

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

   
  

