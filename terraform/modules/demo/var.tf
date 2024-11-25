variable "machine_type" {}
variable "name" {}
variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}