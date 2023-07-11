variable "instance_type" {
    type = string
    description = "defines instance type"
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    description = "defines key name"
    default = "tugba_mac_key"
  
}
variable "from_port" {
    type = number
    description = "from port foe security group"
    
  
}
variable "to_port" {
    type = number
    description = "to port foe security group"
    
  
}
variable "protocol" {
    type = string
    description = "protocol for security group"
   

}
variable "cidr_blocks" {
    type = list(string)
    description = "cidr blocks for security group"
  
}
variable "vpc_id" {
    description = "id of vpc to create ec2 instance"
  
}
variable "subnet_id" {
  description = "id of the subnet to launch ec2 instance"
}