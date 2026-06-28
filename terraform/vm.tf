resource "google_compute_firewall" "allow_ssh_public_vm" {
  name    = "allow-ssh-public-vm"
  network = google_compute_network.nexus.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-vm"]
}

resource "google_compute_instance" "vm_internal" {
  name         = "nexus-vm-internal"
  machine_type = "e2-micro"
  zone         = "asia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.nexus.id
  }
}

resource "google_compute_instance" "vm_public" {
  name         = "nexus-vm-public"
  machine_type = "e2-micro"
  zone         = "asia-southeast1-a"
  tags         = ["public-vm"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.nexus.id

    access_config {}
  }
}

