packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = formatdate("YYYYMMDD-HH-mm", timestamp())
}

source "amazon-ebs" "redis-stack-x86" {
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  ami_name      = "${var.ami_name}-x86-${local.timestamp}"
  region        = "${var.region}"
  instance_type = "${var.instance_type}"
  source_ami_filter {
    filters = {
      name                = "${var.source_ami_filter_name_x86}"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = "${var.most_recent}"
  }
  ssh_username = "${var.ssh_username}"
}

source "amazon-ebs" "redis-stack-arm" {
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  ami_name      = "${var.ami_name}-arm-${local.timestamp}"
  region        = "${var.region}"
  instance_type = "${var.instance_type_arm}"
  source_ami_filter {
    filters = {
      name                = "${var.source_ami_filter_name_arm}"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]
    most_recent = "${var.most_recent}"
  }
  ssh_username = "${var.ssh_username}"
}

build {
  name = "redis-stack"
  sources = [
    // "source.amazon-ebs.redis-stack-x86",
    "source.amazon-ebs.redis-stack-arm"
  ]
  provisioner "shell" {
    script = "redis-stack-installation.sh"
  }

  post-processor "manifest" {
    output     = "aws-artifacts.json"
    strip_path = true
  }
}

