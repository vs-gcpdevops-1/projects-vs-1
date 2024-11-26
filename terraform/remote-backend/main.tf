terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-xsx"
    prefix = "terraform/state"
  }
}

provider "google" {
  project     = "gcp-devops-439413"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "keys.json"
}

resource google_storage_bucket "GCS1"{
  name = "bucket-from-tf-up-sdhgsdgs"
  location = "us-central1"
  storage_class = "STANDARD"
}
