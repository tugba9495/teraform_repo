resource "aws_kms_key" "kms_key_terraform" {
  description                    = var.description
  deletion_window_in_days        = var.deletion_window_in_days
  enable_key_rotation            = var.enable_key_rotation
  is_enabled                     = var.is_enabled
  policy                         = data.aws_iam_policy_document.s3-kms-key-policy-for-encryption.json
  tags = merge(
    local.common_tags
   
     )

  
}
resource "aws_kms_alias" "my_alias_kms" { #This block creates an alias for the KMS key defined in a previous resource block.
  depends_on    = [aws_kms_key.kms_key_terraform]
  name          = var.kms_key_alias_name
  target_key_id = aws_kms_key.kms_key_terraform.id

}
resource "random_id" "my_alias_kms" {#This block generates a random ID to be used as part of the alias name.
  byte_length = var.random_id

}
resource "random_string" "kms-key-name" { #This block generates a random string to be used as part of the alias name.
  keepers = {
    name = local.appname
  }
  special = var.random_string_special
  upper   = var.random_upper
  length  = var.random_lenght
}