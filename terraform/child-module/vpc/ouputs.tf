output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}
output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}
output "aws_eip" {
  value = aws_eip.elastic_ip.public_ip
  
}

