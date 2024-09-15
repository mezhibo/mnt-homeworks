resource "yandex_compute_instance" "jenkins-master" {
  name        = var.vm_01
  hostname    = var.vm_01
  platform_id = var.vm_cpu_id_v1
  resources {
    cores         = var.vms_resources.jenkins.cores
    memory        = var.vms_resources.jenkins.memory
    core_fraction = var.vms_resources.jenkins.fraction
  }
  metadata = local.metadata
  boot_disk {
    initialize_params {
      image_id = "fd8ho23jk8brdkjs1m14"
      type        = "network-ssd"
      size        = "50"
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

resource "yandex_compute_instance" "jenkins-worker" {
  name        = var.vm_02
  hostname    = var.vm_02
  platform_id = var.vm_cpu_id_v1
  resources {
    cores         = var.vms_resources.jw.cores
    memory        = var.vms_resources.jw.memory
    core_fraction = var.vms_resources.jw.fraction
  }
  metadata = local.metadata
  boot_disk {
    initialize_params {
      image_id = "fd8ho23jk8brdkjs1m14"
      type        = "network-ssd"
      size        = "50"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_db.id
    nat        = true
    ip_address = "10.10.10.12"
  }
}
# ### ===vector===
# data "yandex_compute_image" "centos-vector" {
#   family = var.vm_os_ubuntu
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
#   family = var.vm_os_ubuntu
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
