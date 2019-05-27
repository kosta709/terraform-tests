
variable "instance_count" {
  default = 1
}

variable "instance_sn_1" {
  default = "subnet-c272b5a7"
}

variable "instance_sn_2" {
  default = "subnet-727e7934"
}

variable "min_size" {
  default = 1
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 10
}

variable "health_check_grace_period" {
  default = 300
}

variable "env_profile" {
   default = "bv"
}

variable "instance_name" {
  default = "test1"
}

variable "target_group_arns" {
  default = [
    "arn:aws:elasticloadbalancing:us-west-2:839151377425:targetgroup/alb-test-1-group1/cb42814b8c67850b",
    "arn:aws:elasticloadbalancing:us-west-2:839151377425:targetgroup/alb-test-1-group2/63b62743dc0ce739"
  ]
}

variable "key_name" {
  default = "kosta709"
}
