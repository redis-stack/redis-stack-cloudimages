packer {
  required_plugins {
    google = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

locals {
  timestamp            = formatdate("YYYYMMDD-HH-mm", timestamp())
  wait_to_add_ssh_keys = "20s"
}

source "googlecompute" "redis-stack-x86" {
  project_id           = "${var.project_id}"
  image_name           = "${var.image_name}-x86-${local.timestamp}"
  account_file         = "${var.service_account_file}"
  machine_type         = "${var.machine_type}"
  source_image_family  = "${var.image_family}"
  ssh_username         = "${var.ssh_username}"
  wait_to_add_ssh_keys = "${local.wait_to_add_ssh_keys}"
  zone                 = "${var.zone}"
}

source "googlecompute" "redis-stack-arm" {
  project_id           = "${var.project_id}"
  image_name           = "${var.image_name}-arm-${local.timestamp}"
  account_file         = "${var.service_account_file}"
  machine_type         = "${var.machine_type}"
  source_image_family  = "${var.image_family}-arm64"
  ssh_username         = "${var.ssh_username}"
  wait_to_add_ssh_keys = "${local.wait_to_add_ssh_keys}"
  zone                 = "${var.zone}"
}

build {
  name = "redis-stack"
  sources = [
    "source.googlecompute.redis-stack-x86",
    "source.googlecompute.redis-stack-arm"
  ]
  provisioner "shell" {
    script = "redis-stack-installation.sh"
  }
  post-processor "manifest" {
    output     = "gcp-artifacts.json"
    strip_path = true
  }
}
