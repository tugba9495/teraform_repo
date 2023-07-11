data "terraform_remote_state" "vpc" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "homework/vpc/terraform.tfstate"
  region = "us-west-1"
 }
}
data "terraform_remote_state" "public_subnet1" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "homework/vpc/terraform.tfstate"
  region = "us-west-1"
 }
}

data "terraform_remote_state" "public_subnet2_id" {
 backend = "s3"
 config = {
  bucket = "terraform-bucket-homework"
  key    = "homework/vpc/terraform.tfstate"
  region = "us-west-1"
 }
}
# data "terraform_remote_state" "elastic_ip" {
#  backend = "s3"
#  config = {
#   bucket = "terraform-bucket-homework"
#   key    = "homework/vpc/terraform.tfstate"
#   region = "us-west-1"
#  }
# }