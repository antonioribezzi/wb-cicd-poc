data "google_iam_policy" "cloud_build_sa_policy" {
  binding {
    role = "roles/source.writer"
  
    members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
    ]
   }
}
resource "google_sourcerepo_repository_iam_policy" "buildsa" {
  project = data.google_project.project.project_id
  repository = google_sourcerepo_repository.app-deploy.name
  policy_data = data.google_iam_policy.cloud_build_sa_policy.policy_data
}