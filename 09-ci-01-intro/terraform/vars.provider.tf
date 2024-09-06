variable "cloud_id" {
  type        = string
  default = "b1gvqb4s3f495f55ih0b"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1glq93bir0j2f0sl892"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr_a" {
  type    = list(string)
  default = ["10.10.10.0/24"]
}

variable "vpc_name" {
  type        = string
  default     = "vpc_db"
  description = "VPC network for db VMs"
}

variable "subnet_name" {
  type        = string
  default     = "subnet_db"
  description = "Subnet name for db VMs"
}
