# security group for RDS

resource "aws_security_group" "mydb-sg" {
  name        = "rds_sec-grp"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.vpc_tf.id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    security_groups = ["${aws_security_group.ec2-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.sg_name}"
  }
}

# security group for EC2 instance
resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sec-grp"
  description = "Security groups for pub subnet"
  vpc_id      = "${aws_vpc.vpc_tf.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
tags {
Name = "ec2-sec-grp"
}
}