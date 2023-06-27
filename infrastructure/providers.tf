terraform {
  backend "gcs" {
    bucket = "gcp-project-replica-tfstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_name
  region  = var.project_region
  zone    = var.project_zone
}

