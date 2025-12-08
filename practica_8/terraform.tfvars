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
  "iac_version" = "1.13.3"
  "project"     = "fenix"
  "region"      = "us-east-2"
}
region          = "us-east-2"
profile         = "personal"
sg_ingress_cidr = "0.0.0.0/0"

ec2 = {
  "ami"           = "ami-025ca978d4c1d9825"
  "instance_type" = "t3.micro"
}
enabled_monitoring = 0

ingress_port_list = [ 22, 80, 443 ]