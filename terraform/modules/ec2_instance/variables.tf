variable "instance_type" {
  description = "The type of instance to create."
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "The security group IDs to associate with the instance."
  type        = list(string)
}

variable "name" {
  description = "Name of the instance."
  type        = string
}

variable "my_aws_key" {
  description = "Your AWS key."
  type        = string
}