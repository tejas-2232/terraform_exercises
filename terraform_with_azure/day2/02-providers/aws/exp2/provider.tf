provider "aws" {
 region = "us-east-2"
}


provider "aws" {
 region = "us-west-2"
 alias  = "myregion"
}
