resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    "Name" = "VPC_OHIO"
  }
}
