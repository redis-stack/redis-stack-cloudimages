variable "project_id" {
  description = "ID of the GCP project"
  type        = string
  default     = env("PROJECT_ID")
}

variable "image_name" {
  description = "Name of the image to create"
  type        = string
  default     = "redis-stack"
}

variable "service_account_file" {
  description = "Path to the GCP service account file"
  type        = string
  default     = env("GOOGLE_APPLICATION_CREDENTIALS")
}

variable "image_family" {
  description = "Name of the image family to use"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "machine_type_arm" {
  description = "The machine type to use for ARM arch"
  type        = string
  default     = "t2a-standard-2"
}

variable "machine_type_x86" {
  description = "The machine type to use for x86 arch"
  type        = string
  default     = "n2-standard-2"
}

variable "ssh_username" {
  description = "Desired SSH username"
  type        = string
  default     = "packer"
}

variable "zone" {
  description = "Desired zone for the image in gcp"
  type        = string
  default     = "us-central1-a"
}