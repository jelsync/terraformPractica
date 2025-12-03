resource "aws_s3_bucket" "proveedores" {
  bucket = "bucket-${random_uuid.test.result}"
}