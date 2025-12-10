terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "us-east-2"
    bucket  = "example2-us-east-2-produ-terraform-state"
    key     = "terraform.tfstate"
    profile = "personal"
    encrypt = true

    # dynamodb_table = "example2-us-east-2-produ-terraform-state-lock"
    use_lockfile = true
  }
}
