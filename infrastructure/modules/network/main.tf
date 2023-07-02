module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.1"

  project_id   = var.project_name
  network_name = var.network_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "gcp-pr-public-1"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = var.project_region
      description   = "Public Subnet 1"
    },
    {
      subnet_name   = "gcp-pr-public-2"
      subnet_ip     = "10.0.2.0/24"
      subnet_region = var.project_region
      description   = "Public Subnet 2"
    },
    {
      subnet_name           = "gcp-pr-private-1"
      subnet_ip             = "10.0.101.0/24"
      subnet_region         = var.project_region
      description           = "Private Subnet 1"
      subnet_private_access = "true"
    },
    {
      subnet_name           = "gcp-pr-private-2"
      subnet_ip             = "10.0.102.0/24"
      subnet_region         = var.project_region
      description           = "Private Subnet 2"
      subnet_private_access = "true"
    }
  ]

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
    {
      name              = "ingress-ssh"
      destination_range = "${data.external.my_ip.result.MY_IP}/32"
      description       = "ingress to allow SSH access"
      tags              = "ingress-ssh"
      next_hop_internet = "false"
    }
  ]
}
