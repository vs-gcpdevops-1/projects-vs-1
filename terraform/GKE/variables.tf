
variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "gcp-devops-439413"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "gke-on-vpc-cluster"
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}

variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-svc"
}

# variable "compute_engine_service_account" {
#   description = "Service account to associate to the nodes in the cluster"
# }

