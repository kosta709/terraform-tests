terraform {
  backend "s3" {
    bucket = "cfterraformtest123"
    key    = "t1/sg"
    region = "us-west-2"
  }
}