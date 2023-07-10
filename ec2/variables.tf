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
    default = 22
  
}
variable "to_port" {
    type = number
    description = "to port foe security group"
    default = 22
  
}
variable "protocol" {
    type = string
    description = "protocol for security group"
    default = "tcp"

}
variable "cidr_blocks" {
    type = list(string)
    description = "cidr blocks for security group"
  default = ["0.0.0.0/0"]
}



