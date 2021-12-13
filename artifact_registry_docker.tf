resource "google_artifact_registry_repository" "docker-registry" {
  provider = google-beta

  location = "us-central1"
  repository_id = "docker-registry"
  description = "POC Docker repository"
  format = "DOCKER"
}