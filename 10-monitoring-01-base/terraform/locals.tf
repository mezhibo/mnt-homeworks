locals {
  metadata = {  
    serial-port-enable = 1
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
 }
}