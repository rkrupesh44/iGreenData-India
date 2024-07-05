provider "google" {
  credentials = file("<path-to-service-account-key>.json")
  project     = "<your-gcp-project-id>"
  region      = "us-central1"
}

resource "google_container_cluster" "primary" {
  name     = "version-app-cluster"
  location = "us-central1"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.kubeconfig_raw
  sensitive = true
}
