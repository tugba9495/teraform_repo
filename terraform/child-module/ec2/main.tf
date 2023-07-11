resource "ec2_instance" "my_ec2_instance" {
  ami           = "ami-0fd61683ae1a27a64"
  instance_type = var.instance_type
  key_name = var.key_name
#   vpc_id = var.vpc_id
  

  tags = {
    Name = "terraform_instance"
  }
}