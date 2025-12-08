resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance sg"
  description = "Permite ingreso por ssh y permite el trafico hacia el exterior"
  vpc_id      = aws_vpc.vpc_ohio.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      description = "Ingreso al puerto ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public instance sg"
  }
}
