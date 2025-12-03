
resource "random_uuid" "test" {
}

resource "random_string" "random" {
  count = 3
  length  = 3
  special = false
}
