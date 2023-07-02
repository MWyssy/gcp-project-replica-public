output "subnet_IDs" {
  value       = module.vpc.subnets_ids
  description = "The IDs of the created subnets"
}
