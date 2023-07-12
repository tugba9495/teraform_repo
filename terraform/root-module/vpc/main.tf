module "aws_vpc" {
  source          = "../../child-module/vpc"
  cidr_block      = "10.0.0.0/16"
  public_s_cidr_1 = "10.0.4.0/24"
  public_s_cidr_2 = "10.0.3.0/24"
  private_subnet1 = "10.0.1.0/24"
  private_subnet2 = "10.0.2.0/24"
  destination_cidr_block_for_public_route = "0.0.0.0/0"
  
}

