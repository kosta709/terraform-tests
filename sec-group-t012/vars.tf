variable "vpc_name" {
   default = "k8s.cf-cd.com"
}

variable "sg_name" {
   default = "t012-common"
}

variable "allow_ssh_cidrs" {
  default = [
    "46.117.166.111/32",
    "172.16.0.0/12"
  ]
}

variable "ports_cidrs" {
  # type = object
  default = [{
    description = "rule-1"
    from_port = "32000"
    to_port = "33000"
    protocol = "tcp"
    cidr_blocks = [
      "46.117.166.111/32",
      "172.16.0.0/12"
    ]
  },
  {
    description = "rule-2"
    from_port = "34000"
    to_port = "35000"
    protocol = "tcp"
    cidr_blocks = [
      "46.117.166.112/32",
      "10.0.0.0/12"
    ]
  }
  ]
}