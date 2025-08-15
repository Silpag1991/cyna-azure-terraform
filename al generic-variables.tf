variable "resource_group_name" {
  type = string #bool map list of string
  default = "cyan-rg"
}

variable "resource_group_location" {
  type = string 
  default = "eastus2"
}

variable "business_desicion" {
  type = string
  default = "sap"
}

variable "environment" {
  type = string 
  default = "hr"
}