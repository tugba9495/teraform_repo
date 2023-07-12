module "ec2_instance" {
    source = "../../child-module/ec2"
    instance_type = "t2.micro"
    key_name = "tugba_mac_key"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    eip = data.terraform_remote_state.vpc.outputs.aws_eip
    availability_zone_for_ebs = "us-west-1a"

    public_subnet1 = data.terraform_remote_state.vpc.outputs.public_subnet1
  
 }
 resource "aws_ebs_volume" "ebs_volume" {
    availability_zone = "us-west-1a"
    encrypted = true
    kms_key_id =  data.terraform_remote_state.kms_key.outputs.aws_kms_key
  
    size = 8

  tags = {
    Name = "ebs_terraform"
  }
}
resource "aws_volume_attachment" "ebs_volume_attachment" {
  volume_id = aws_ebs_volume.ebs_volume.id
  instance_id = module.ec2_instance.ec2_instance_id
  device_name = "/dev/sdf"

  
}
  
 
 