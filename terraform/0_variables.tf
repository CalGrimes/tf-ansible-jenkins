variable "region" {
  description = "The region where the resources are created."
  default     = "eu-west-2"
}

variable "prefix" {
  description = "Prefix will be included in the name of most resources."
  default = ""
}

variable "my_ip" {
  description = "Your IP address."
  default = ""
}