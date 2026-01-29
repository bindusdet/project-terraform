provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "EC2"{
    ami = "ami-055a9df0c8c9f681c"
    instance_type = "t3.micro"
    count = 3
}
