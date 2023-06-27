variable "project_region" {
  description = "Region the project will sit in"
  type        = string
  default     = "europe-west2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "gcp-project-replica-391115"
}

variable "project_zone" {
  description = "The region's zone the project will sit in"
  type        = string
  default     = "europe-west2-a"
}

variable "keyring_name" {
  description = "Name of the keyring used for the remote state bucket"
  type        = string
  default     = "gcp-pr-tfstate-keyring"
}

variable "key_name" {
  description = "Name of the key used for the remote state bucket"
  type        = string
  default     = "gcp-pr-tfstate-key"
}

variable "bucket_name" {
  description = "Name of the remote state bucket"
  type        = string
  default     = "gcp-project-replica-tfstate"
}
