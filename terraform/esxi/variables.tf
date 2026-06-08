variable "esxi_hostname" {
  type = string
}

variable "esxi_username" {
  type = string
}

variable "esxi_password" {
  type      = string
  sensitive = true
}

variable "esxi_hostport" {
  type    = string
  default = "22"
}

variable "esxi_hostssl" {
  type    = string
  default = "443"
}

variable "guest_name" {
  type    = string
  default = "hybrid-esxi-vm"
}

variable "disk_store" {
  type = string
}

variable "virtual_network" {
  type = string
}

variable "ubuntu_ova_url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"
}
