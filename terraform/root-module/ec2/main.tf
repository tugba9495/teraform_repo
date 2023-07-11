module "ec2_instance" {
    source = "../../child-module/ec2"
    instance_type = "t2.micro"
    key_name = "tugba_mac_key"
   
}