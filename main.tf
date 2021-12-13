provider "google" {
  project = "wb-cicd-poc"
  region  = "us-central1"
  zone    = "us-central1-c"
}

provider "google-beta" {
  project = "wb-cicd-poc"
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "google_project" "project" {
}