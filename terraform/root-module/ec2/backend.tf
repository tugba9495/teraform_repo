terraform {
    backend "s3" {
        bucket = "terraform-bucket-homework"
        key = "homework_2/new/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "cloudformation-template"
      
    }
  
}