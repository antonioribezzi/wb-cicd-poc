resource "google_cloudbuild_trigger" "build-trigger" {
  trigger_template {
    tag_name = "^[0-9]+\\.[0-9]+\\.[0-9]+.*$"
    repo_name   = "app-build"
  }
  name = "app-build-tag"

  substitutions = {
      _ENV= "dev"
  }

  filename = "cloudbuild-tag.yaml"
}

resource "google_cloudbuild_trigger" "build-commit-trigger" {
  trigger_template {
    branch_name = ".*"
    repo_name   = "app-build"
  }
  name = "app-build-buildonly"

  filename = "cloudbuild-buildonly.yaml"
}
