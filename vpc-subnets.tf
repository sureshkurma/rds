#VPC
resource "aws_vpc" "vpc_tf" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

#Public subnets
resource "aws_subnet" "subnet_1" {
  vpc_id            = "${aws_vpc.vpc_tf.id}"
  cidr_block        = "${var.subnet_1_cidr}"
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true
  tags {
    Name = "pub_subnet1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = "${aws_vpc.vpc_tf.id}"
  cidr_block        = "${var.subnet_2_cidr}"
  availability_zone = "${var.az_2}"
  map_public_ip_on_launch = true
  tags {
    Name = "pub_subnet2"
  }
}

# Private subnets
resource "aws_subnet" "subnet_3" {
    vpc_id = "${aws_vpc.vpc_tf.id}"
    cidr_block = "${var.subnet_3_cidr}"
    map_public_ip_on_launch = false
    availability_zone = "${var.az_3}"

    tags {
        Name = "pvt_subnet3"
    }
}

resource "aws_subnet" "subnet_4" {
    vpc_id = "${aws_vpc.vpc_tf.id}"
    cidr_block = "${var.subnet_4_cidr}"
    map_public_ip_on_launch = false
    availability_zone = "${var.az_4}"

    tags {
        Name = "pvt_subnet4"
    }
}



# Internet Gateway
resource "aws_internet_gateway" "vpc-tf-igw" {
    vpc_id = "${aws_vpc.vpc_tf.id}"
	tags {
		name = "vpc tf internet gateway"
	}
}

# Route table
resource "aws_route_table" "vpc-tf-public-rt" {
    vpc_id = "${aws_vpc.vpc_tf.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.vpc-tf-igw.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table" "vpc-tf-private-rt" {
    vpc_id = "${aws_vpc.vpc_tf.id}"

    tags {
        Name = "Private Subnet"
    }
}


resource "aws_route_table_association" "vpc-tf-public-rt1" {
    subnet_id = "${aws_subnet.subnet_1.id}"
    route_table_id = "${aws_route_table.vpc-tf-public-rt.id}"
}

resource "aws_route_table_association" "vpc-tf-public-rt2" {
    subnet_id = "${aws_subnet.subnet_2.id}"
    route_table_id = "${aws_route_table.vpc-tf-public-rt.id}"
}

resource "aws_route_table_association" "vpc-tf-private-rt3" {
    subnet_id = "${aws_subnet.subnet_3.id}"
    route_table_id = "${aws_route_table.vpc-tf-private-rt.id}"
}

resource "aws_route_table_association" "vpc-tf-private-rt4" {
    subnet_id = "${aws_subnet.subnet_4.id}"
    route_table_id = "${aws_route_table.vpc-tf-private-rt.id}"
}