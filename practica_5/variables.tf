variable "ohio_cidr" {
    description = "CIDR Virginia"
    type        = string
    sensitive = false
}
variable "env" {
    description = "Environment"
    type        = string
    sensitive = false
}

variable "public_subnet" {
    description = "Public Subnet CIDR"
    type        = string
    sensitive = false
  
}

variable "private_subnet" { 
    description = "Private Subnet CIDR"
    type        = string
    sensitive = false
  
}