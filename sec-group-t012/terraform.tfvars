vpc_name  = "k8s.cf-cd.com"
sg_name  = "t012-common"

allow_ssh_cidrs =  [
    "46.117.166.111/32",
    "172.16.0.0/12"
  ]


ports_cidrs = [{
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
  },
  {
    description = "rule-3"
    from_port = "38000"
    to_port = "39000"
    protocol = "tcp"
    cidr_blocks = [
      "46.117.166.112/32",
      "10.0.0.0/12"
    ]
  }
  ]
