data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_launch_configuration" "lc" {
  name_prefix   = "webcofig-lc"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = var.key_name
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  count = var.instance_count
  vpc_zone_identifier = [var.instance_sn_1, var.instance_sn_2]
  name = "${var.env_profile}-${var.instance_name}-asg"

  //  load_balancers        = [ "${var.elb}" ]

  min_size         = var.min_size
  desired_capacity = var.desired_capacity
  max_size         = var.max_size

  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"

  target_group_arns    = var.target_group_arns
  launch_configuration = aws_launch_configuration.lc.id

  tag {
    key                 = "Name"
    value               = "${var.env_profile}-${var.instance_name}-${count.index + 1}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = var.env_profile
    propagate_at_launch = true
  }
  tag {
    key                 = "Managed_by"
    value               = "Terraform"
    propagate_at_launch = true
  }
  tag {
    key                 = "Owner"
    value               = "DevOps"
    propagate_at_launch = true
  }
}