variable "aws_s3_bucket_name" {
    type = string
    description = "give unique name for s3 bucket"
    default = "new-s3-bucket-tugba"
  
}
variable "bucket_versioning_configuration" {
    type = string
    description = "enable or disable bucket versioning"
    default = "Enabled"
  
}
variable "kms_key_arn" {
    type = string
    description = "give kms key arn"
    default = "arn:aws:kms:us-west-1:371191637464:key/06b4af18-f554-4be3-a118-3da014d80f0e"
  
}

