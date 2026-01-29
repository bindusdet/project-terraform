provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Terraform_vpc"
    }
}

resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.idcidr
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "Terraform_vsb"
    }
}