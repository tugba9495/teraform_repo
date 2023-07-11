module "ec2_instance" {
    source = "../../child-module/ec2"
    instance_type = "t2.micro"
    key_name = "tugba_mac_key"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

    subnet_id = data.terraform_remote_state.public_subnet1.outputs.public_subnet1
  
 }
 
