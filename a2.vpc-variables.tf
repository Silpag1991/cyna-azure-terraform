variable "vnet_name" {
  description = "Virtual network name"
  type = string
  default = "vnet default"
}

variable "vnet_address_space" {
    description = "vnet address space"
    type = list(string)
    default = [ "10.0.0.0/16" ]
  
}

variable "web_subnet_name" {
    type = string
    default = "websubnet"
  
}

variable "web_subnet_address" {
    type = list(string)
    default = [ "10.0.1.0/24" ]
  
}

variable "db_subnet_name" {
    type = string
    default = "dbsubnet"
  
}

variable "db_subnet_address" {
    type = list(string)
    default = [ "10.0.2.0/24" ]
  
}