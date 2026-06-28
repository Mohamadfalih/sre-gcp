resource "google_storage_bucket" "nexus_storage" {
  name          = "nexus-artifact-storage-cloudmile" # Nama harus unik sedunia
  location      = "ASIA-SOUTHEAST1"
  force_destroy = true

  uniform_bucket_level_access = true
}
