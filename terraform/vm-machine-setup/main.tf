
resource "google_compute_instance" "vm-from-tf" {
  count        = var.vm_count
  name         = "app-instance-${count.index + 1}"
  machine_type = "e2-medium"
  zone = "asia-southeast1-a"

  allow_stopping_for_update = true

  network_interface {
    network    = google_compute_network.custom-vpc-tf.id
    subnetwork = google_compute_subnetwork.sub-sg.self_link
    access_config {
      // Ephemeral public IP
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
    auto_delete = false
  }

  tags = ["http-server"]

  labels = {
    "env" = "tflearning"
  }

  
  scheduling {
    preemptible = false
    automatic_restart = false
  }

    metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt -y install apache2
    echo "Hello world from $(hostname) $(hostname -I)" > /var/www/html/index.html
  EOT

  
  service_account {
    email = "365537862342-compute@developer.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

  depends_on = [
    google_compute_network.custom-vpc-tf,
    google_compute_subnetwork.sub-sg
  ]

}

resource "google_compute_disk" "disk" {
  count = var.vm_count
  name  = "data-disk-${count.index + 1}"
  size  = 15
  zone  = "asia-southeast1-a"
  type  = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  count    = var.vm_count
  disk     = google_compute_disk.disk[count.index].id
  instance = google_compute_instance.vm-from-tf[count.index].id
}


# Outputs
output "instance_names" {
  value = [for instance in google_compute_instance.vm-from-tf : instance.name]
}

output "instance_ips" {
  value = [for instance in google_compute_instance.vm-from-tf : instance.network_interface[0].access_config[0].nat_ip]
}

output "disk_names" {
  value = [for disk in google_compute_disk.disk : disk.name]
}

