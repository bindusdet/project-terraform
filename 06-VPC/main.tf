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
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "Terraform_vsb"
    }

    import {
        to = aws_vpc.myvpc
        id =vpc-01bd533c3b994a777
    }

    import {
        to = aws_subnet.mysubnet
        id =subnet-0621dc7f101578121
    }
}