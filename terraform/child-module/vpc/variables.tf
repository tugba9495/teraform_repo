variable "cidr_block" {
  
  type = string
  description = "define cidr block for vpc"
}
variable "public_s_cidr_1" {
    type = string
    description = "cidr block for public subnet1"
  
}
variable "public_s_cidr_2" {
    type = string
    description = "cidr block for public subnet2"
  
}
variable "private_subnet1" {
    type = string
    description = "cidr block for private subnet1"
  
}
variable "private_subnet2" {
    type = string
    description = "cidr block for private subnet2"
  
}
variable "destination_cidr_block_for_public_route" {
    type = string
    description = "cidr block  for route"
}
variable "destination_cidr_block_for_private_route" {
    type = string
    description = "cidr block  for route"
    default = "0.0.0.0/0"
}