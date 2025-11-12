resource "local_file" "productos" {
  content  = "Esto es un archivo de prueba con Terraform"
  filename = "productos.txt"
}