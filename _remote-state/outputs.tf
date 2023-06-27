output "tfstate_bucket_id" {
  description = "Id of the created remote state bucket"
  value       = google_storage_bucket.gcp_pr_tfstate.id
}
