resource "aws_instance" "public_instance" {
  ami           = "ami-025ca978d4c1d9825"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "HelloWorld"
  }
}
