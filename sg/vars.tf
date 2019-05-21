variable "vpc_name" {
   default = "k8s.cf-cd.com"
}

variable "sg_name" {
   default = "tt1-common"
}

variable "allow_ssh_cidrs" {
  default = [
    "46.117.166.111/32",
    "172.16.0.0/12"
  ]
}