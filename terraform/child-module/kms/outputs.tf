output "random_string" {
    value = random_string.kms-key-name
  
}
output "kms_key_id" {
    value = aws_kms_key.kms_key_terraform.id
    description = "kms key id output"
  
}
output "aws_kms_key" {
    value = aws_kms_key.kms_key_terraform.arn
  
}