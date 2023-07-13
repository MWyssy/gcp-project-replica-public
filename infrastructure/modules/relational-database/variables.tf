variable "database_name" {
  description = "Name of the Google database"
  type        = string
}

variable "postgres_version" {
  description = "Version of Postgres"
  type        = string
}

variable "db_user_name" {
  description = "Database Username"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
}

variable "project_region" {
  description = "Region the project will sit in"
  type        = string
}

variable "profile_id" {
  description = "Database profile id"
  type        = string
}

variable "display_name" {
  description = "Database display name"
  type        = string
}
