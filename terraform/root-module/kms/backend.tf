terraform {
    backend "s3" {
        bucket = "terraform-bucket-homework"

        key = "homework/ec2/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "cloudformation-template"
      
    }
  
}