variable "project_region" {
  description = "Region the project will sit in"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnets"
  type        = string
}
