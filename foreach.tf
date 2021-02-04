variable "foreachnames" {
  type   =  map
  description = "testing foreach"
  default = {
      "10.1.100.0/24" = 1
      "10.1.102.0/24" = 2
      "10.1.103.0/24" = 3
  }
}




resource "aws_subnet" "foreach-subnet"{
    for_each = var.foreachnames
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "us-east-2a"
    cidr_block = "${each.key}"

    tags = {
        Name = "public-subnet-1"
    }
}

