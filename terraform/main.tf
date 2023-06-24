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
    zone    = var.zone_name
}

terraform {
    backend "gcs" {
        bucket  = "bullrun-iaac"
        prefix  = "ansible"
        credentials = "pg-bull-run-8c9ceac45e93.json"
    }
}

#     enable_autopilot = true

resource "google_container_cluster" "primary" {
    name     = var.environment
    location = var.region_name

    enable_autopilot = true

    # remove_default_node_pool = false
    # initial_node_count       = 1
    # enable_autopilot = true

    # node_config {
    #     preemptible  = true
    #     machine_type = var.mach_type
    #     oauth_scopes = [
    #         "https://www.googleapis.com/auth/cloud-platform"
    #     ]
    # }
    master_authorized_networks_config {
        cidr_blocks {
            cidr_block = "122.129.66.254/32"
            display_name = "office"
        }
    }
    
    lifecycle {
        ignore_changes = [
            node_config,
            ip_allocation_policy,
        ]
    }
}
