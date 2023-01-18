packer {
  required_plugins {
    google = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

locals {
  timestamp = formatdate("DD-MM-YYYY", timestamp())
}

source "googlecompute" "redis-stack-x86" {
  project_id  = "${var.project_id}"
  image_name  = "${var.image_name}-x86-${local.timestamp}"
  account_file = "${var.service_account_file}"
  source_image_family = "${var.image_family}"
  ssh_username = "${var.ssh_username}"
  zone = "${var.zone}"
}

source "googlecompute" "redis-stack-arm" {
  project_id  = "${var.project_id}"
  image_name  = "${var.image_name}-arm-${local.timestamp}"
  account_file = "${var.service_account_file}"
  source_image_family = "${var.image_family}"
  ssh_username = "${var.ssh_username}"
  zone = "${var.zone}"
}

build {
  name = "redis-stack"
  sources = [
    "source.googlecompute.redis-stack-x86",
    "source.googlecompute.redis-stack-arm"
  ]
  provisioner "shell" {
    script = "../redis-stack-installation.sh"
  }
}
