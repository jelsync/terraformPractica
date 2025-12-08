resource "aws_s3_bucket" "fenix_bucket" {
  bucket = local.s3_suffix
}