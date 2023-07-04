output "cluster_endpoint" {
  value = google_container_cluster.gcp-pr-k8s.endpoint
}

output "cluster_name" {
  value = google_container_cluster.gcp-pr-k8s.name
}

