output "aws_ami" {
    value = aws_instance.terraform_instance.id
  
}
output "ec2_instance_id" {
  value = aws_instance.terraform_instance.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.terraform_instance.public_ip
}
# output "ebs_volume_id" {
#   value = aws_ebs_volume.ebs_volume.id
  
# }