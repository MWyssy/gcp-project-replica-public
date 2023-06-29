resource "google_artifact_registry_repository" "gcp_pr_container_registry_fe" {
  location      = var.project_region
  repository_id = var.fe_repo_name
  description   = "This is the registry that holds the Docker images for the Frontend"
  format        = "DOCKER"

  kms_key_name = google_kms_crypto_key.gcp_pr_container_reg.id

  docker_config {
    immutable_tags = true
  }
}

resource "google_artifact_registry_repository" "gcp_pr_container_registry_be" {
  location      = var.project_region
  repository_id = var.be_repo_name
  description   = "This is the registry that holds the Docker images for the Backtend"
  format        = "DOCKER"

  kms_key_name = google_kms_crypto_key.gcp_pr_container_reg.id

  docker_config {
    immutable_tags = true
  }
}

resource "google_kms_key_ring" "gcp_pr_container_reg" {
  name     = var.keyring_name
  location = var.project_region
}

resource "google_kms_crypto_key" "gcp_pr_container_reg" {
  name     = var.key_name
  key_ring = google_kms_key_ring.gcp_pr_container_reg.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "gcp_pr_container_reg" {
  crypto_key_id = google_kms_crypto_key.gcp_pr_container_reg.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "user:mike@wyss.co.uk",
    "serviceAccount:gcp-pr-sa@gcp-project-replica-391115.iam.gserviceaccount.com",
    "serviceAccount:service-71612204665@gcp-sa-artifactregistry.iam.gserviceaccount.com"
  ]
}
