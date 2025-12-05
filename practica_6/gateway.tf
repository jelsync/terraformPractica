resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_ohio.id

  tags = {
    Name = "internet_gateway vpc_ohio"
  }
}