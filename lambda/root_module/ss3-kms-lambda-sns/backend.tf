terraform {
  backend "s3" {
    bucket = "terraform-aws-tugba"
    key = "lambda/terraform.tfstate"
    region = "us-west-1"
    
    
  }
}