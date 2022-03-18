resource "aws_instance" "first_server" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"

  tags = {
    "Name" = "test_env"
  }
}
