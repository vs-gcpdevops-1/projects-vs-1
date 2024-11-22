# we can use conditions in terraform via a symbol of list comprehension. ( ? and :)

# a=true
# if (a==true):
#  print("a is 1")
# else:
#  print("a is 0") 

#count --> In terraform is meta-argument which is used for simple iterations

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
#   credentials = "keys.json"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "create_instance" {
  description = "Flag to determine if the Compute Engine instance should be created"
  type        = bool
  default     = false
}

resource "google_compute_instance" "example" {
  count        = var.create_instance ? 1 : 0
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral external IP
    }
  }
}

# Output to confirm resource creation
output "instance_created" {
  value = var.create_instance ? "Compute Engine instance created." : "No instance created."
}