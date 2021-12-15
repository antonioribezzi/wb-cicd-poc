#!/bin/sh
vault write auth/kubernetes/config \
        token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
        kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
        kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
        issuer="https://kubernetes.default.svc.cluster.local"

echo 'path "sys/mounts" { capabilities = ["read"] } path "secrets/metadata/cybernetics-dev/*" { capabilities = ["list"] } path "secrets/data/cybernetics-dev/*" { capabilities = ["list", "read"] }' | vault policy write cybernetics-dev-read -
vault write auth/kubernetes/role/cybernetics-dev-read \
  bound_service_account_names=default \
  bound_service_account_namespaces=cybernetics-apps-dev \
  policies=cybernetics-dev-read \
  ttl=1h
  

echo 'path "sys/mounts" { capabilities = ["read"] } path "secrets/metadata/cybernetics-int/*" { capabilities = ["list"] } path "secrets/data/cybernetics-int/*" { capabilities = ["list", "read"] }' | vault policy write cybernetics-int-read -
vault write auth/kubernetes/role/cybernetics-int-read \
  bound_service_account_names=default \
  bound_service_account_namespaces=cybernetics-apps-int \
  policies=cybernetics-int-read \
  ttl=1h
  
 
echo 'path "sys/mounts" { capabilities = ["read"] } path "secrets/metadata/cybernetics-prod/*" { capabilities = ["list"] } path "secrets/data/cybernetics-prod/*" { capabilities = ["list", "read"] }' | vault policy write cybernetics-prod-read -
vault write auth/kubernetes/role/cybernetics-prod-read \
  bound_service_account_names=default \
  bound_service_account_namespaces=cybernetics-apps-prod \
  policies=cybernetics-prod-read \
  ttl=1h