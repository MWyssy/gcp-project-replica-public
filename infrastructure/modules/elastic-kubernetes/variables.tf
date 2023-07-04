variable "project_region" {
  description = "Region the project will sit in"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Cluster"
  type        = string
}

variable "network" {
  description = "Name of the Network"
  type        = string
}

variable "subnetwork" {
  description = "Name of the subnetwork"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
}
