data local_file foo {
  filename = "learn.txt"
}

output name1 {
  value       = data.local_file.foo.content
}

data "google_compute_network" "xyz" {
  name = "vpc-custom"
}

output "vpcname" {
  value = data.google_compute_network.xyz.id
}
