resource "yandex_vpc_network" "vpc_db" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "subnet_db" {
  name           = var.subnet_name
  zone      = var.default_zone
  network_id     = yandex_vpc_network.vpc_db.id
  v4_cidr_blocks = var.cidr_a
}
