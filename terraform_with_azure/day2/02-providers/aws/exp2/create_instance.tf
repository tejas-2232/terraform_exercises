resource "aws_instance" "red" {
  ami           = "ami-08b6f2a5c291246a0"
  instance_type = "t2.micro"

  tags = {
    Name = "red-dev"
  }
}

resource "aws_instance" "white" {
  provider = aws.myregion
  ami           = "ami-0b9f27b05e1de14e9"
  instance_type = "t2.micro"

  tags = {
    Name = "white-test"
  }
}
