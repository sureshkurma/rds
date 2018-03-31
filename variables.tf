##  var
# variables
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-97785bed"
    us-east-2 = "ami-87785bad"
    us-west-1 = "ami-98765erf"
  }
}

variable "keyname" {
  default = "Nvirg"
}

variable "identifier" {
  default     = "mydb-rds"
  description = "Identifier for your DB"
}

variable "storage" {
  default     = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "mysql"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"

  default = {
    mysql    = "5.6.37"
    postgres = "9.4.1"
  }
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "Instance class"
}

variable "db_name" {
  default     = "mydb"
  description = "db name"
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = "gp2"
}

variable "username" {
  default     = "suresh"
  description = "User name"
}

variable "password" {
  description = "password, provide through your ENV variables"
}

variable "cidr_blocks" {
  default     = "0.0.0.0/0"
  description = "CIDR for sg"
}

variable "sg_name" {
  default     = "rds_sg"
  description = "Tag Name for sg"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "subnet_1_cidr" {
  default     = "10.0.1.0/24"
  description = "pub subnet1 cidr"
}

variable "subnet_2_cidr" {
  default     = "10.0.2.0/24"
  description = "pub subnet2 cidr"
}

variable "subnet_3_cidr" {
  default     = "10.0.3.0/24"
  description = "pvt subnet3 cidr"
}

variable "subnet_4_cidr" {
  default     = "10.0.4.0/24"
  description = "pvt subnet4 cidr"
}

variable "az_1" {
  default     = "us-east-1a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "us-east-1b"
  description = "Your Az2, use AWS CLI to find your account specific"
}

variable "az_3" {
  default     = "us-east-1c"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_4" {
  default     = "us-east-1d"
  description = "Your Az2, use AWS CLI to find your account specific"
}
