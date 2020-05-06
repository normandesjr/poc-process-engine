provider "aws" {
  version = "~> 2.0"
  profile = "zup"
  region  = var.aws_region
}