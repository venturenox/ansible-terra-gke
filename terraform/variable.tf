variable "project_id" {
  description = "unique id of gcp project"
  default= "crewnetics-dev"
}

variable "credential" {
  description = "crewnetics-dev"
  default = "crewnetics-dev-352099b311f4.json"
}

variable "region_name" {
  description = "region of project"
  default = "us-central1"
}

variable "cluster_name" {
  description = "Name of Cluster"
  default = "test"
}

