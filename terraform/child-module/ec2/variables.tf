variable "instance_type" {
  
  type = string
  description = "instance type for ec2 instance"
}
variable "key_name" {
  
  type = string
  description = "keyname for ec2 instance"
}
variable "vpc_id" {
    type = string
    default = "vpc-007d7939c6b5fe409"
  
}