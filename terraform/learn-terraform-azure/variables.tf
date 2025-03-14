variable "resource_group_name" {
  type        = string
  default     = "rgSushil"
  description = "Resource group name"
}

variable "resource_group_name_prefix" {
  type    = string
  default = "value"
}

variable "resource_group_location" {
  type        = string
  default     = "East US"
  description = "Location of resource group"
}