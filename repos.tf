resource "google_sourcerepo_repository" "app-build" {
  name = "app-build"
}

resource "google_sourcerepo_repository" "app-deploy" {
  name = "app-deploy"
}

resource "google_sourcerepo_repository" "argocd-apps" {
  name = "argocd-apps"
}