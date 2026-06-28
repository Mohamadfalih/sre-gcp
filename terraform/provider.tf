provider "google" {
  project = "sre-cloudmile"
  region  = "asia-southeast1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.5"
    }
  }
}
