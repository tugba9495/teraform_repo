# terraform {
#     backend "s3" {
#         bucket = "terraform-bucket-homework"

#         key = "s3/kms/terraform.tfstate"
#         region = "us-west-1"
#         dynamodb_table = "cloudformation-template"
      
#     }
  
# }