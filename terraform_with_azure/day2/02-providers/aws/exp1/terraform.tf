# using AWS provider in between the range of greater than 3.63.0 - less than 3.65.0
terraform {
  required_providers {
    aws = {
      version = ">=3.63.0, <=3.65.0"
    }
  }
}
