resource "google_compute_network" "gcp_pr_vpc" {
  project                 = var.project_name
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcp_pr_vpc" {
  project       = var.project_name
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/16"
  region        = var.project_region
  network       = google_compute_network.gcp_pr_vpc.id
}
