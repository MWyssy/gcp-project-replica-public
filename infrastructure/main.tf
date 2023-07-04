module "container_registry" {
  source = "./modules/container-registry"

  project_region = var.project_region
  fe_repo_name   = "gcp-pr-container-reg-fe"
  be_repo_name   = "gcp-pr-container-reg-be"
  key_name       = "gcp-pr-container-reg-key"
  keyring_name   = "gcp-pr-container-reg-keyring"
}

module "network" {
  source = "./modules/network"

  project_region = var.project_region
  project_name   = var.project_name
  network_name   = "gcp-pr-vpc"
  subnet_name    = "gcp-pr-subnet"
}

module "elastic_kubernetes" {
  source = "./modules/elastic-kubernetes"

  project_region = var.project_region
  project_name   = var.project_name
  cluster_name   = "gcp-pr-gke"
  network        = module.network.network_id
  subnetwork     = module.network.subnetwork_id
  node_count     = 1

}
