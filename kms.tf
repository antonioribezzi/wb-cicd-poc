resource "google_service_account" "vault_kms_service_account" {
  account_id   = "vault-gcpkms"
  display_name = "Vault KMS for auto-unseal"
}


# Create a KMS key ring
resource "google_kms_key_ring" "vault_keyring" {
  name     = "vault_keyring"
  location = "global"
}

# Create a crypto key for the key ring
resource "google_kms_crypto_key" "vault_crypto_key" {
  name            = "vault_crypto_key"
  key_ring        = "${google_kms_key_ring.vault_keyring.id}"
  rotation_period = "100000s"
}

# Add the service account to the Keyring
resource "google_kms_key_ring_iam_binding" "vault_iam_kms_binding" {
  key_ring_id = "${google_kms_key_ring.vault_keyring.id}"
  role = "roles/owner"

  members = [
    "serviceAccount:${google_service_account.vault_kms_service_account.email}",
  ]
}
