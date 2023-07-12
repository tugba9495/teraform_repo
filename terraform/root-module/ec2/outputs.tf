output "ebs_volume_id" {
  value = aws_ebs_volume.ebs_volume.id
  
}
output "ec2_instance_id" {
    value = module.ec2_instance.ec2_instance_id
  
}