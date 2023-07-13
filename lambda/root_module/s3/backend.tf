terraform {
  backend "s3" {
    bucket = "terraform-aws-tugba"
    key = "s3/terraform.tfstate"
    region = "us-west-1"
    
    
  }
}