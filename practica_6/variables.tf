variable "ohio_cidr" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = false
}
# variable "env" {
#   description = "Environment"
#   type        = string
#   sensitive   = false
# }

# variable "public_subnet" {
#     description = "Public Subnet CIDR"
#     type        = string
#     sensitive = false
# }

# variable "private_subnet" { 
#     description = "Private Subnet CIDR"
#     type        = string
#     sensitive = false
# }

variable "subnet" {
  description = "Lista de Subnet"
  type        = list(string)
  sensitive   = false
}

variable "tags" {
  description = "Tags aplicar a los recursos"
  type        = map(string)
  sensitive   = false
}

variable "region" {
  description = "Region del proyecto"
  type        = string
}

variable "profile" {
  description = "Perfil AWS CLI"
  type        = string

}

variable "sg_ingress_cidr" {
  description = "CIDR para reglas de ingreso"
  type        = string
  
}

variable "ec2" {
  description = "Configuracion de instancia EC2"
  type = map(string)
  
}