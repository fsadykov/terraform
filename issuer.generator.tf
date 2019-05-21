resource "local_file" "foo" {
    content = <<EOF
---
apiVersion: certmanager.k8s.io/v1alpha1
kind: ClusterIssuer
metadata:
 name: letsencrypt-fuchicorp-prod
 namespace: ${var.namespace}
spec:
 acme:
   server: https://acme-v02.api.letsencrypt.org/directory
   email: ${var.email}
   privateKeySecretRef:
     name: letsencrypt-sec-prod
   http01: {}
---
      EOF
    filename = "issuer.yaml"
}
