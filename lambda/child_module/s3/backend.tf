terraform {
  backend "s3" {
    bucket = "terraform-aws-tugba"
    key = "s3/new/terraform.tfstate"
    region = "us-west-1"
    
    
  }
}