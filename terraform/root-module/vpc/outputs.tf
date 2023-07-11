output "vpc_id" {
  value = module.aws_vpc.vpc_id
}
output "public_subnet1" {
  value = module.aws_vpc.public_subnet1_id
}
output "public_subnet2" {
  value = module.aws_vpc.public_subnet2_id
}
# output "aws_eip" {
  
#   value = module.aws_eip.elastic_ip_id
# }

