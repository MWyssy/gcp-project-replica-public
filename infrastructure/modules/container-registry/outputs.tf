output "frontend_repo_id" {
  value       = google_artifact_registry_repository.gcp_pr_container_registry_fe.id
  description = "The id of the frontend artifact registry"
}

output "backtend_repo_id" {
  value       = google_artifact_registry_repository.gcp_pr_container_registry_be.id
  description = "The id of the backtend artifact registry"
}
