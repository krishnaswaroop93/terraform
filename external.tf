data "aws_vpc" "swaroop"{
id = "vpc-0d328f75b4dffce2e"
}


resource "aws_subnet" "public-subnet-2" {
    vpc_id   = "${data.aws_vpc.swaroop.id}"
    availability_zone = "us-east-2a"
    cidr_block    =  "10.1.4.0/24"
    tags = {
        Name = "ENG-AWS-B06-Public-Subnet-2"
    }
}

resource "aws_subnet" "public-subnet-3" {
    vpc_id   = "${data.aws_vpc.swaroop.id}"
    availability_zone = "us-east-2b"
    cidr_block    =  "10.1.5.0/24"
    tags = {
        Name = "ENG-AWS-B06-Public-Subnet-3"
    }
}