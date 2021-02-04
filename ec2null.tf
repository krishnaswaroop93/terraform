resource "aws_instance" "null-1" {
     #ami = var.imagename
     ami = "ami-0d2751e39abf67ea8"
     #ami = "${data.aws_ami.my_ami.id}"
     availability_zone = "us-east-2a"
     instance_type = "t2.nano"
     key_name = "LaptopKey"
     subnet_id = "${aws_subnet.subnet1-public.id}"
     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
     associate_public_ip_address = true	
     tags = {
         Name = "Server-1"
         Env = "Prod"
         Owner = "Sree"
 	CostCenter = "ABCD"
     }
     
 }
 resource "null_resource" "cluster" {
     provisioner "file" {
         source = "script1.sh"
         destination = "/tmp/script1.sh"
         connection {
             type = "ssh"
             user = "ubuntu"
             private_key = "${file("laptopkey.pem")}"
             host = "${aws_instance.null-1.public_ip}"
         }
     
     }
   
 }