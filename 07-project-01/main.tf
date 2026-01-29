# provider
provider "aws" {
  region = "us-west-2"
}

# vpc creation
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "vpc-project-by-terraform"
  }
}
# subnet-1
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    tags = {
      Name = "subnet-1-project-by-terraform"
    }
  }
  


# subnet-2
resource "aws_subnet" "subnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = true
    tags = {
      Name = "subnet-2-project-by-terraform"
    }
  }
  
# route table
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "public-route-table-project-by-terraform"
    }
  }
  
# Internet gateway 
resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "MyIGW"
    }
}
# Route 
resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myigw.id
}


# Route table association

resource "aws_route_table_association" "public_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.subnet-1.id
}





