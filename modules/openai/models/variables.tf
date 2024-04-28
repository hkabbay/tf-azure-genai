# define variables for azure openai model
variable "openai_deployment_name" {
  type = string
}

variable "openai_model_name" {
  type = string
}


variable "capacity" {
  type = number
}

variable "openai_deployment_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "openai_account_name" {
  type = string
}