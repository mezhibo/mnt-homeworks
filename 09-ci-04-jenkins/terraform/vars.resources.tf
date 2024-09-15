### vms_resources
variable "vms_resources" {
  type = map(map(number))
  default = {
    jenkins = {
      cores    = 2
      memory   = 4
      fraction = 100
    }
    jw = {
      cores    = 2
      memory   = 4
      fraction = 100
    }
    lighthouse = {
      cores    = 2
      memory   = 2
      fraction = 5
    }
  }
}

variable "vm_os_ubuntu" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}

variable "vm_cpu_id_v1" {
  type        = string
  default     = "standard-v1"
  description = "cpu id v1"
}

### vm_name/hostname
variable "vm_01" {
  type        = string
  default     = "jenkins"
  description = "vm name"
}

variable "vm_02" {
  type        = string
  default     = "jw"
  description = "vm name"
}

variable "vm_03" {
  type        = string
  default     = "lighthouse"
  description = "vm name"
}
