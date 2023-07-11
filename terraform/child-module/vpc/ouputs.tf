output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "public_s_cidr_1_id" {
    value = aws_subnet.public_subnet1
  
}