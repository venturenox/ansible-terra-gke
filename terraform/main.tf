terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.3.0"
        }
    }
}

provider "google" {
    credentials = file(var.credential)
    project = var.project_id 
    region  = var.region_name
}

terraform {
    backend "gcs" {
        bucket  = "ansi-tera-iaac"
        prefix  = "ansible"
        credentials = "crewnetics-dev-352099b311f4.json"
    }
}

resource "google_container_cluster" "primary" {
    name     = var.cluster_name
    location = var.region_name

    enable_autopilot = true
    
    lifecycle {
        ignore_changes = [
            node_config,
            ip_allocation_policy,
        ]
    }
}
