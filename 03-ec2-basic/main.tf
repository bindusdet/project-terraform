provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "myinstance"{
    ami = "ami-0532be01f26a3de55"
    instance_type = "t3.micro"
}