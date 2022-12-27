packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = formatdate("DD-MM-YYYY", timestamp())
}

source "amazon-ebs" "redis-stack-focal" {
  ami_name      = "${var.ami_name}-${local.timestamp}"
  region        = "${var.region}"
  instance_type = "${var.instance_type}"
  source_ami_filter {
    filters = {
      name                = "${var.source_ami_filter_name}"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = "${var.most_recent}"
  }
  ssh_username = "${var.ssh_username}"
}

build {
  name = "redis-stack-focal"
  sources = [
    "source.amazon-ebs.redis-stack-focal"
  ]
  provisioner "shell" {
    script = "../redis-stack-installation.sh"
  }
}

