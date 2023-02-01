variable "access_key" {
  description = "AWS access key"
  type        = string
  default     = env("AWS_ACCESS_KEY")
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = env("AWS_SECRET_KEY")
}

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

variable "instance_type_arm" {
  description = "AWS instance type"
  type        = string
  default     = "c6g.xlarge"
}

variable "source_ami_filter_name_x86" {
  description = "Desired source ami filter name"
  type        = string
  default     = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*" #x86
}

variable "source_ami_filter_name_arm" {
  description = "Desired source ami filter name"
  type        = string
  default     = "ubuntu/images/*ubuntu-focal-20.04-arm64-server-*" #arm
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
