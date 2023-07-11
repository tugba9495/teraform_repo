data "terraform_remote_state" "vpc" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "homework/vpc/terraform.tfstate"
  region = "us-west-1"
 }
}