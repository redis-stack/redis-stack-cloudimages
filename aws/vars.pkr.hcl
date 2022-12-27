variable "ami_name" {
  description = "Name of AMI"
  type        = string
  default     = "redis-stack"
}

variable "region" {
  description = "AWS instance region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "AWS instance type"
  type        = string
  default     = "t2.micro"
}

variable "source_ami_filter_name" {
  description = "Desired source ami filter name"
  type        = string
  default     = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
}

variable "most_recent" {
  description = "Uses most recent build"
  type        = bool
  default     = true
}

variable "ssh_username" {
  description = "Desired SSH Username"
  type        = string
  default     = "ubuntu"
}
