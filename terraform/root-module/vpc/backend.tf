terraform {
    backend "s3" {
        bucket = "terraform-bucket-homework"

        key = "homework/vpc/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "cloudformation-template"
      
    }
  
}