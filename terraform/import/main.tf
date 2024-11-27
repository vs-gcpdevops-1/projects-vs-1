terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

provider "google" {
  project     = "gcp-devops-439413"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_storage_bucket" "sample" {
    name = "my-manual-bucket"
    location = "us-central1"
    project = "gcp-devops-439413"
    storage_class = "NEARLINE"
}