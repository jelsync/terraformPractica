resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr

   tags = {
    Name = "VPC_OHIO"
    env = "dev"
  }
}

resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr

   tags = {
    Name = "VPC_VIRGINIA"
    env = "dev"
  }
  provider = aws.virginia
}