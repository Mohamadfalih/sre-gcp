resource "google_compute_network" "nexus" {
  name                    = "nexus-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "nexus" {
  name          = "nexus-subnet"
  ip_cidr_range = "10.10.0.0/24"

  region  = "asia-southeast1"
  network = google_compute_network.nexus.id
}
