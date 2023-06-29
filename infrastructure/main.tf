module "container_registry" {
  source = "./modules/container-registry"

  project_region = var.project_region
  fe_repo_name   = "gcp-pr-container-reg-fe"
  be_repo_name   = "gcp-pr-container-reg-be"
  key_name       = "gcp-pr-container-reg-key"
  keyring_name   = "gcp-pr-container-reg-keyring"
}
