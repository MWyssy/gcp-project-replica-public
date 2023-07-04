output "network_id" {
  value = google_compute_network.gcp_pr_vpc.name
}

output "subnetwork_id" {
  value = google_compute_subnetwork.gcp_pr_vpc.name
}
