resource "google_cloudbuild_trigger" "build-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "app-build"
  }
  name = "app-build"

  substitutions = {
      _ENV= "dev"
  }

  filename = "cloudbuild.yaml"
}
