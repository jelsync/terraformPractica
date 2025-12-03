resource "local_file" "productos" {
  content  = "Esto es un archivo de prueba con Terraform"
  filename = "productos-${random_uuid.test.result}.txt"
}

resource "local_file" "clientes" {
  count = 3
  content  = "Aqui tenemos los clientes"
  filename = "clientes-${random_string.random[count.index].result}.txt"
}
