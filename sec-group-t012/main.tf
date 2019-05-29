
data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
  # filter {
  #   name   = "tag:Name"
  #   values = ["${var.vpc_name}"]
  # }
}


locals {
  vpc_id = data.aws_vpc.vpc.id
}


resource "aws_security_group" "t012_common" {
  vpc_id = local.vpc_id
  name = var.sg_name

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each =  var.ports_cidrs 
    content {
      description = ingress.value.description
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.sg_name
  }
}

# data "aws_security_group" "sg" {
#   vpc_id = "${local.vpc_id}"
#   filter {
#     name   = "tag:Name"
#     values = ["${var.sg_name}"]
#   }

# }


# resource "aws_security_group_rule" "allow_ssh_subnets" {
#   security_group_id = "${data.aws_security_group.sg.id}"
#   type            = "ingress"
#   from_port       = 22
#   to_port         = 22
#   protocol        = "tcp"

#   cidr_blocks = ["${var.allow_ssh_cidrs}"]
# }


