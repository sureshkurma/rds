# Launch an EC2 instance to connect to Database

resource "aws_instance" "ec2" {
 ami = "${lookup(var.AMIS,var.AWS_REGION)}"
 instance_type = "t2.micro"
 key_name = "${var.keyname}"
 subnet_id = "${aws_subnet.subnet_1.id}"
 vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
}