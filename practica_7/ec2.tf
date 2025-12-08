# Count para crear múltiples instancias EC2 según la lista proporcionada
# variable "instancias_ec2" {
#   description = "Número de instancias EC2 a crear"
#   type        = list(string)
#   default     = ["apache1", "mysql1", "jumpserver"]
# } 

# resource "aws_instance" "public_instance" {
#   count                  = length(var.instancias_ec2)
#   ami                    = var.ec2.ami
#   instance_type          = var.ec2.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

#   user_data = file("scripts/userdata.sh")
#   tags = {
#     Name = element(var.instancias_ec2, count.index)
#   } 
# }

# Usando for_each para crear múltiples instancias EC2 según el conjunto proporcionado

variable "instancias_ec2" {
  description = "Número de instancias EC2 a crear"
  type        = set(string)
  default     = ["apache1", "mysql1", "jumpserver"]
}

resource "aws_instance" "public_instance" {
  for_each               = var.instancias_ec2  # En el caso que el tipo de variable sea una lista usar toset(var.instancias_ec2) asi se convierte el tipo list a set sin dejar de usar el foreach
  ami                    = var.ec2.ami
  instance_type          = var.ec2.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  user_data = file("scripts/userdata.sh")
  tags = {
    Name = each.value
  }
}
