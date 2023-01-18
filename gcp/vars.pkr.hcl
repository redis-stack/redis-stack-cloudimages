variable "project_id" {
  description = "ID of the GCP project"
  type        = string
  default     = "redis-stack"
}

variable "image_name" {
  description = "Name of the image to create"
  type        = string
  default     = "ubuntu-focal"
}

variable "family" {
  description = "Name of the image family to which the new image belongs"
  type        = string
  default     = "ubuntu-focal-family"
}

variable "service_account_file" {
  description = "Path to the GCP service account file"
  type        = string
  default     = env("GOOGLE_APPLICATION_CREDENTIALS")
}

variable "image_family" {
  description = "Name of the image family to use"
  type        = string
  default     = "ubuntu-focal-lts"
}

variable "ssh_username" {
  description = "Desired SSH username"
  type        = string
  default     = "ubuntu"
}

variable "zone" {
  description = "Desired zone for the image in gcp"
  type        = string
  default     = "us-central1-a"
}