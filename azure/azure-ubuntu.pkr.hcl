packer {
  required_plugins {
    azure = {
      version = ">= 1.4.3"
      source  = "github.com/hashicorp/azure"
    }
  }
}

locals {
  timestamp = formatdate("YYYYMMDD-HH-mm", timestamp())
}

source "azure-arm" "redis-stack-x64" {
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  image_offer     = "${var.image_offer}"
  image_publisher = "${var.image_publisher}"
  image_sku       = "${var.image_sku}"
  location        = "${var.location}"
  managed_image_name = "${var.image_name}-x64-${local.timestamp}"
  managed_image_resource_group_name = "${var.managed_image_resource_group_name}"
  os_type         = "${var.os_type}"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  vm_size         = "${var.vm_size_x64}"
}

build {
  name = "redis-stack-server"
  sources = [
    "source.azure-arm.redis-stack-x64"
  ]
  provisioner "shell" {
    script = "redis-stack-installation.sh"
  }

  post-processor "manifest" {
    output     = "azure-artifacts.json"
    strip_path = true
  }
}
