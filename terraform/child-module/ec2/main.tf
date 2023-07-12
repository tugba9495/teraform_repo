resource "aws_instance" "terraform_instance" {
    ami                        = data.aws_ami.terraform_ami.id 
    instance_type              = var.instance_type
    key_name                   = var.key_name
    subnet_id                  = var.public_subnet1
    vpc_security_group_ids            = [aws_security_group.terraform_security_group.id]
    associate_public_ip_address = true
    
    
    user_data                  = file("../../child-module/ec2/user_data.sh")
    tags                       = merge(
        local.common_tags,
       { "Name"                = "terraform_instance" }
    ) 
}
resource "aws_security_group" "terraform_security_group" {
    name                      = "terraform_sg_aws"
    description               = "allow shh for ec2 user"
    vpc_id                    = var.vpc_id
    
                     
    

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
resource "aws_eip_association" "elastic_ip_association" {
    instance_id = aws_instance.terraform_instance.id
    public_ip = var.eip
    
  
}


