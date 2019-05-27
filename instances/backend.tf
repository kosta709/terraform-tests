terraform {
  backend "s3" {
    bucket = "cfterraformtest123"
    key    = "t1/hw"
    region = "us-west-2"
  }
}