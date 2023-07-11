module "s3_kms_key" {
    source = "../../child-module/kms"
    description = "this module creates kms key with iam policy"
    deletion_window_in_days = 10
    enable_key_rotation = true
    is_enabled = true
    kms_key_alias_name = "alias/my_alias_kms_key"
    random_id = 10
    random_string_special = false
    random_upper = true
    random_lenght = 7
  
}