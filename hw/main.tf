provider "aws" {
  region = "us-west-2"
}

data "aws_vpcs" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

locals {
  vpc_id = "${element(data.aws_vpcs.vpc.ids, 0)}"
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${local.vpc_id}"
}

data "aws_subnet" "subnet0" {
  id = "${element(data.aws_subnet_ids.subnets.ids, 0)}"
}

resource "aws_security_group" "tt1_common" {
  vpc_id = "${data.aws_subnet.subnet0.vpc_id}"
  name = "tt1_common"
  ingress {
    cidr_blocks = ["${data.aws_subnet.subnet0.cidr_block}"]
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tt1-common"
  }
}

resource "aws_instance" "tt1" {
  ami = "ami-061392db613a6357b"
  instance_type = "t2.micro"
  key_name = "kosta709"
  subnet_id = "${data.aws_subnet.subnet0.id}"
  vpc_security_group_ids = ["${aws_security_group.tt1_common.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "tt1"
  }
}

output "public_ip" {
  value = "${aws_instance.tt1.public_ip}"
}

output "sec_group_id" {
  value = "${aws_security_group.tt1_common.id}"
}