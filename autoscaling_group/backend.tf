terraform {
  backend "s3" {
    bucket = "cfterraformtest123"
    key    = "t1/asg"
    region = "us-west-2"
  }
}