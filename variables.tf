variable "ssh_private_key_path" {
  description = "SSH private key path"
}

variable "ssh_puplic_key_path" {
  description = "SSH public key path"
}

variable "zone" {
  description = "The Yandex.Cloud availability zone to create resources in."
  default = "ru-central1-a"
}

variable "cloud_id" {
  description = "The ID of the Yandex.Cloud to apply any resources to. "
}

variable "folder_id" {
  description = "A folder is an isolated space where Yandex.Cloud resources are created and grouped."
}

variable "token" {
  description = "Security token used for authentication in Yandex.Cloud."
}


variable "boot_disk_image_id" {
  description = "Centos 7"
  default = "fd83869rbingor0in0ui"
}


variable "boot_disk_size" {
  description = ""
  default = 8
}

variable "instance_name" {
  description = ""
  default = "bitrix-demo"
}

variable "instance_cores" {
  description = ""
  default = 1
}

variable "instance_core_fraction" {
  description = ""
  default = 20
}

variable "instance_memory" {
  description = ""
  default = 0.5
}

variable "bitrix_env_hostname" {
  description = ""
  default = "bitrix-demo"
}

variable "bitrix_env_mysql_password" {
  description = ""
}

variable "network" {
  description = ""
  default = "bitrix-demo-network"
}

variable "subnet" {
  description = ""
  default = "bitrix-demo-subnet"
}

variable "v4_cidr_blocks" {
  description = ""
  default = "192.168.11.0/24"
}

variable "ssh_user" {
  description = ""
  default =  "centos" 
}


