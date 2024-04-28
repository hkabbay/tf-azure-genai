# define variables for azure openai account
variable "openai_account_name" {
  type = string
}

variable "location" {
  type = string
}

variable "openai_sku" {
  type = string
}

variable "openai_kind" {
  type = string
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

variable "allowed_ip_addresses" {
  type = list(string)
  default = ["10.10.10.10"]
}