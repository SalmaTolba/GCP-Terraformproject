module "network" {

  source                 = "./network"
  Management_subnet_cidr = var.Management_subnet_cidr
  Restricted_subnet_cidr = var.Restricted_subnet_cidr
  region                 = var.region
  project_id             = var.project_id

}

module "gke" {

  source                   = "./gke"
  pods_ipv4_cidr_block     = var.pods_ipv4_cidr_block
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
  network_name             = module.network.network_name
  subnet_name              = module.network.Restricted_subnet_name
  master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  project_id               = var.project_id
  region = var.region
  master_authorized_networks_config = var.Management_subnet_cidr
  # network has to be provisioned before gke
  depends_on = [
    module.network
  ]
}