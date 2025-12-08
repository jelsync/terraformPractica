ohio_cidr = "10.10.0.0/16"
# env           = "dev"
# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"
subnet = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "Jelsyn"
  "cloud"       = "aws"
  "iac"         = "terraform"
  "iac_version" = "~> 1.13.3"
}
region = "us-east-2"
profile = "personal"