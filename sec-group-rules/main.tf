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

data "aws_security_group" "sg" {
  vpc_id = "${local.vpc_id}"
  filter {
    name   = "tag:Name"
    values = ["${var.sg_name}"]
  }

}


resource "aws_security_group_rule" "allow_ssh_subnets" {
  count = "${var.ssh_rule_count}"
  security_group_id = "${data.aws_security_group.sg.id}"
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"

  cidr_blocks = ["${var.allow_ssh_cidrs}"]
}


