variable "resource_group_name" {
  type    = string
  default = "s1212153"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  type    = string
  default = "student"
}

variable "ssh_public_key_path" {
  type    = string
  default = "/home/student/.ssh/skylab.pub"
}
