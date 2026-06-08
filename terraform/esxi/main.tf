terraform {
  required_providers {
    esxi = {
      source  = "josenk/esxi"
      version = "~> 1.10"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "vm" {
  guest_name     = var.guest_name
  disk_store     = var.disk_store
  boot_disk_size = "20"
  memsize        = "2048"
  numvcpus       = "1"

  ovf_source = var.ubuntu_ova_url

  network_interfaces {
    virtual_network = var.virtual_network
  }

  guestinfo = {
    "userdata.encoding" = "gzip+base64"
    "userdata"          = base64gzip(file("${path.module}/cloudinit.yaml"))

    "metadata.encoding" = "gzip+base64"
    "metadata" = base64gzip(jsonencode({
      "local-hostname" = var.guest_name
    }))
  }
}
