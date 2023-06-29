variable "project_region" {
  description = "Region the project will sit in"
  type        = string
}

variable "fe_repo_name" {
  description = "Name of the Artifact Registry for the frontend"
  type        = string
}

variable "be_repo_name" {
  description = "Name of the Artifact Registry for the backend"
  type        = string
}

variable "keyring_name" {
  description = "Name of the Keyring holding the KMS encryption key"
  type        = string
}

variable "key_name" {
  description = "Name of the KMS encryption key"
  type        = string
}
