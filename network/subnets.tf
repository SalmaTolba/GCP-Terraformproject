resource "google_compute_subnetwork" "Management_Subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.Management_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "Restricted_Subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.Restricted_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}