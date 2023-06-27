variable "project_region" {
  description = "Region the project will sit in"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "project_zone" {
  description = "The region's zone the project will sit in"
  type        = string
}

variable "keyring_name" {
  description = "Name of the keyring used for the remote state bucket"
  type        = string
}

variable "key_name" {
  description = "Name of the key used for the remote state bucket"
  type        = string
}

variable "bucket_name" {
  description = "Name of the remote state bucket"
  type        = string
}
