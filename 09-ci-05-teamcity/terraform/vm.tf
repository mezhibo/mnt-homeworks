### ===clickhouse===
data "yandex_compute_image" "centos-clickhouse" {
  family = var.vm_os_centos
}
resource "yandex_compute_instance" "nexus" {
  name        = var.vm_01
  hostname    = var.vm_01
  platform_id = var.vm_cpu_id_v1
  resources {
    cores         = 4
    memory        = 4
    core_fraction = 100
  }
  metadata = local.metadata
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-clickhouse.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_db.id
    nat        = true
    ip_address = "10.10.10.11"
  }
}

# ### ===vector===
# data "yandex_compute_image" "centos-vector" {
#   family = var.vm_os_centos
# }
# resource "yandex_compute_instance" "vector" {
#   name        = var.vm_02
#   hostname    = var.vm_02
#   platform_id = var.vm_cpu_id_v1
#   resources {
#     cores         = var.vms_resources.vector.cores
#     memory        = var.vms_resources.vector.memory
#     core_fraction = var.vms_resources.vector.fraction
#   }
#   metadata = local.metadata
#   boot_disk {
#     initialize_params {
#       image_id = data.yandex_compute_image.centos-vector.image_id
#     }
#   }
#   scheduling_policy {
#     preemptible = true
#   }
#   network_interface {
#     subnet_id  = yandex_vpc_subnet.subnet_db.id
#     nat        = true
#     ip_address = "10.10.10.12"
#   }
# }

# ### ===lighthouse===
# data "yandex_compute_image" "centos-lighthouse" {
#   family = var.vm_os_centos
# }
# resource "yandex_compute_instance" "lighthouse" {
#   name        = var.vm_03
#   hostname    = var.vm_03
#   platform_id = var.vm_cpu_id_v1
#   resources {
#     cores         = var.vms_resources.lighthouse.cores
#     memory        = var.vms_resources.lighthouse.memory
#     core_fraction = var.vms_resources.lighthouse.fraction
#   }
#   metadata = local.metadata
#   boot_disk {
#     initialize_params {
#       image_id = data.yandex_compute_image.centos-lighthouse.image_id
#     }
#   }
#   scheduling_policy {
#     preemptible = true
#   }
#   network_interface {
#     subnet_id  = yandex_vpc_subnet.subnet_db.id
#     nat        = true
#     ip_address = "10.10.10.13"
#   }
# }
