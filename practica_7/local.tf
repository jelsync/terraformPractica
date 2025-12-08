locals {
  sufix = "${var.tags.project}-${var.tags.env}-${var.region}"
}

locals {
  s3_suffix = "${var.tags.project}-${var.tags.env}-${random_string.random.result}"
}