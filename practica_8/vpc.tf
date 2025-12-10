resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    "Name" = "VPC_OHIO"
  }
}

module "mybucket" {
  source      = "./modulos/s3"
  bucket_name = local.s3_suffix

}

# You cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
# module "terraform_state_backend" {
#   source = "cloudposse/tfstate-backend/aws"
#   # Cloud Posse recommends pinning every module to a specific version
#   version    = "1.7.1"
#   namespace  = "example2"
#   stage      = "produ"
#   environment = "us-east-2"
#   name       = "terraform"
#   attributes = ["state"]

#   terraform_backend_config_file_path = "."
#   terraform_backend_config_file_name = "backend.tf"
#   force_destroy                      = false
# }
