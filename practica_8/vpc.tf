resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    "Name" = "VPC_OHIO"
  }
}

module "mybucket" {
  source = "./modulos/s3"
  bucket_name = local.s3_suffix
  
}