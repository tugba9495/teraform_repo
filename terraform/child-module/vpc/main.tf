resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    
    tags = {
      Name = "my_vpc"
    }
  
}
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_s_cidr_1
  tags = {
     Name = "public_subnet_1"

  }
 
  
  }
  resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_s_cidr_2
  tags = {
     Name = "public_subnet_2"
    
  }

 

  }
  resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet1
  tags = {
     Name = "private_subnet_1"
    
  }

 
  }
  resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet2
  tags = {
     Name = "private_subnet_2"
    
  }

 
  }
  resource "aws_internet_gateway" "my_internet_gw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = "my_internet_gw"
    }
  }
  resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    
    tags = {
      Name = "public_route_table"
    }


}


resource "aws_route" "terraform_route_public" {
    route_table_id          = aws_route_table.public_route_table.id
    destination_cidr_block  = var.destination_cidr_block_for_public_route
    gateway_id =  aws_internet_gateway.my_internet_gw.id
}
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = "private_route_table"

    }
}
resource "aws_route" "terraform_route_private" {
  route_table_id = aws_route_table.private_route_table.id
  destination_cidr_block = var.destination_cidr_block_for_private_route
  nat_gateway_id = aws_nat_gateway.nat_gateway.id
  
}





resource "aws_route_table_association" "public_subnet_1" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public_route_table.id
  
}
resource "aws_route_table_association" "public_subnet_2" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.public_route_table.id
  
}
resource "aws_route_table_association" "private_subnet_1" {
    subnet_id = aws_subnet.private_subnet1.id
    route_table_id = aws_route_table.private_route_table.id
  
}
resource "aws_route_table_association" "private_subnet_2" {
    subnet_id = aws_subnet.private_subnet2.id
    route_table_id = aws_route_table.private_route_table.id
  
}
resource "aws_eip" "elastic_ip" {
  domain = "vpc"
  

  
  
}
resource "aws_nat_gateway" "nat_gateway" {
 
  # allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet1.id
  connectivity_type = "private"
  tags = {
    Name = "my_natgateway"
  }
  
}



