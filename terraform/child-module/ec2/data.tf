data "aws_ami" "terraform_ami" {
  most_recent = true

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
data "aws_vpc" "terraform_vpc_id" {
    default = true
 

    
  
}
