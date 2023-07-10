resource "aws_instance" "terraform_instance" {
    ami                        = data.aws_ami.terraform_ami.id 
    instance_type              = var.instance_type
    key_name                   = var.key_name
    user_data                  = file("user_data.sh")
    tags                       = merge(
        local.common_tags,
       { "Name"                = "terraform_instance" }
    )
     
  
  
}
resource "aws_security_group" "terraform_security_group" {
    name                      = "terraform_sg_aws"
    description               = "allo shh for ec2 user"
    vpc_id                    = data.aws_vpc.terraform_vpc_id.id
  
}
resource "aws_security_group_rule" "terraform_security_group_rule_ingress" {
    type                      = "ingress"
    from_port                 = var.from_port
    to_port                   = var.to_port
    protocol                  = var.protocol
    cidr_blocks               = var.cidr_blocks
    security_group_id         = aws_security_group.terraform_security_group.id
  
}
resource "aws_security_group_rule" "terraform_security_group_rule_egress" {
  type                        = "egress"
  protocol                    = "-1"
  to_port                     = 0
  from_port                   = 0
  security_group_id           = aws_security_group.terraform_security_group.id
  cidr_blocks =               ["0.0.0.0/0"]
}