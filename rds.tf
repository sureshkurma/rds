resource "aws_db_instance" "default" {
  depends_on             = ["aws_security_group.mydb-sg"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  skip_final_snapshot    = true
  multi_az               = true
  storage_type           = "${var.storage_type}"
  vpc_security_group_ids = ["${aws_security_group.mydb-sg.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.rds_grp.id}"
}

resource "aws_db_subnet_group" "rds_grp" {
  name        = "rds_subnet_group"
  description = "RDS subnet group"
  subnet_ids  = ["${aws_subnet.subnet_3.id}", "${aws_subnet.subnet_4.id}"]
}
