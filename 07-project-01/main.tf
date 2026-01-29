#provider
#vpc creation
#subne-1
#subnet-2
#route table
#internet gateway
#route tabel association 



provider "aws" {
     region = "us-west-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "Terraform_vpc"
    }
}

resource "aws_subnet" "mysubnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "Terraform_subnet1"
    }  
}     

resource "aws_subnet" "mysubnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = true
    tags = {
        Name = "Terraform_subnet2"
    }   
}   

#route table
resource "aws_route_table" "myroute-table-public" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "Terraform_route-table"
    }
}     

#internet gateway
resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "Terraform_igw"
    }
}  

#route 
resource "aws_route" "route-to-internet" {
    route_table_id = aws_route_table.myroute-table-public.id
    destination_cidr_block = "10.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
}


#route table association
resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.mysubnet-1.id    
    route_table_id = aws_route_table.myroute-table-public.id
}









