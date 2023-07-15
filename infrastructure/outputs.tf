output "k8s_cluster_name" {
  value = module.elastic_kubernetes.cluster_name
}

output "k8s_cluster_host" {
  value = module.elastic_kubernetes.cluster_endpoint
}

output "project_region" {
  value = var.project_region
}

output "project_name" {
  value = var.project_name
}
