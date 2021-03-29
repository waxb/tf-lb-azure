#comes from global vars
variable "location" {
  description = "The geolocation where the resources are deployed"
}

variable "rg_name" {
  description = "The name of resource group where the resources are deployed"
}

variable "pip_id" {
  description = "PIP of frontend"
}

#comes from module definition
variable "loadbalancer_name" {
}

variable "protocol" {
}

variable "ports" {
  type = list(string)
}

