variable "project_id" {
  description = "unique id of gcp project"
  default= "crewnetics-dev"
  # default= "pg-bull-run"
}

variable "credential" {
  description = "crewnetics-dev"
  # description = "pg-bull-run"
  sensitive   = true
}

variable "region_name" {
  description = "region of project"
  default = "us-central1"
}

variable "zone_name" {
  description = "zone inside region"
  default = "us-central1-a"
}

variable "environment" {
  description = "name of environment"
  default = "test"
}

variable "mach_type" {
  description = "machine type to be used for nodepool"
  default = "e2-medium"
}

variable "autopilot" {
  description = "Enable Autopilot mode for GKE cluster"
  type        = bool
  default     = true
}
