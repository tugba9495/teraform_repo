output "aws_ami" {
    value = aws_instance.terraform_instance.id
  
}
output "aws_security_group" {
    value = aws_security_group.terraform_security_group.id
  
}