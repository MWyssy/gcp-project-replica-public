provider "google" {
  project = var.project_name
  region  = var.project_region
  zone    = var.project_zone
}

resource "google_kms_key_ring" "gcp_pr_tfstate" {
  name     = var.keyring_name
  location = var.project_region
}

resource "google_kms_crypto_key" "gcp_pr_tfstate" {
  name     = var.key_name
  key_ring = google_kms_key_ring.gcp_pr_tfstate.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_version" "gcp_pr_tfstate" {
  crypto_key = google_kms_crypto_key.gcp_pr_tfstate.id
}

resource "google_storage_bucket" "gcp_pr_tfstate" {
  name                     = var.bucket_name
  location                 = var.project_region
  storage_class            = "STANDARD"
  force_destroy            = true
  public_access_prevention = "enforced"
  versioning {
    enabled = false
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.gcp_pr_tfstate.id
  }
}
