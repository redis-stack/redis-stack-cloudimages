variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = env("AZURE_SUBSCRIPTION_ID")
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  default     = env("AZURE_CLIENT_ID")
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  default     = env("AZURE_CLIENT_SECRET")
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default     = env("AZURE_TENANT_ID")
}

variable "image_publisher" {
  description = "Azure Image Publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Azure Image Offer"
  type        = string
  default     = "0001-com-ubuntu-server-focal"
}

variable "image_sku" {
  description = "Azure Image SKU"
  type        = string
  default     = "20_04-lts-gen2"
}

// Enable when we will support arm
// variable "image_sku_arm" {
//   description = "Azure Image SKU"
//   type        = string
//   default     = "20_04-lts-arm64"
// }

variable "location" {
  description = "Azure Region Location"
  type        = string
  default     = "eastus"
}

variable "vm_size_x64" {
  description = "Azure Virtual Machine Size for x64"
  type        = string
  default     = "Standard_DS2_v2"
}

// Enable when we will support arm
// variable "vm_size_arm" {
//   description = "Azure Virtual Machine Size for arm"
//   type        = string
//   default     = "Standard_D2ps_v5"
// }

variable "os_type" {
  description = "Azure OS Type"
  type        = string
  default     = "Linux"
}

variable "image_name" {
  description = "Azure Image Name"
  type        = string
  default     = "redis-stack"
}

variable "managed_image_resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
  default     = "redisStackCloudImages"
}
