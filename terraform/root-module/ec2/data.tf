data "terraform_remote_state" "vpc" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "homework/vpc/terraform.tfstate"
  region = "us-west-1"
 }
}


data "terraform_remote_state" "kms_key" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "s3/kms/terraform.tfstate"
  region = "us-west-1"
 }
}

