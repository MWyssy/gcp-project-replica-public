resource "google_container_cluster" "gcp-pr-k8s" {
  name                     = var.cluster_name
  location                 = var.project_region
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnetwork
}

resource "google_container_node_pool" "gcp_pr_nodes" {
  name       = google_container_cluster.gcp-pr-k8s.name
  location   = var.project_region
  cluster    = google_container_cluster.gcp-pr-k8s.name
  node_count = var.node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_name
    }

    machine_type = "e2-small"
    tags         = ["gke-node", "${var.project_name}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

