# define variables for azure aisearch service

variable "aisearch_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aisearch_sku" {
  type = string
}

variable "allowed_ip_addresses" {
  type = list(string)
  default = ["10.10.10.10"]
}

variable "tags" {
  type = map(string)
  default = {
    "env" = "development"
  }
}

variable "resource_group_name" {
  type = string
}
