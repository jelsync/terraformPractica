resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr

   tags = {
    Name = "VPC_OHIO"
    env = var.env
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_ohio.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_ohio.id
  cidr_block = var.private_subnet

  tags = {
    Name = "private_subnet"
  }
}