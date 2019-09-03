terraform {
  backend "s3" {
    bucket = "cfterraformtest123"
    key    = "dev/sg012"
    region = "us-west-2"
  }
}