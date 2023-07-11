variable "description" {
    type = string
    description = "description for kms key"
}
variable "deletion_window_in_days" {
    type = number
    description = "deletion duration for kms key"
  
}
variable "enable_key_rotation" {
    type = bool
    description = "enable key rotation for kms key"
  
}
variable "is_enabled" {
    type = bool
    description = "enabled"

}
variable "kms_key_alias_name" {
  
  type = string
  description = "defines kms key alias"
}
variable "random_id" {
    type = number
    description = "random id for kms key alias"
  
}
variable "random_string_special" {
    type = bool
    description = "special characher is true or false"
  
}
variable "random_upper" {
    type = bool
    description = "upper case is true or false"
  
}
variable "random_lenght" {
    type = number
    description = "lenght of alias"
  
}