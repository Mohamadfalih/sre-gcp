resource "google_container_cluster" "primary" {
  name     = "nexus-cluster"
  location = "asia-southeast1-a"

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "nexus-node-pool"
  location   = "asia-southeast1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  lifecycle {
    ignore_changes = [
      node_config[0].resource_labels,
      node_config[0].kubelet_config,
    ]
  }
  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
