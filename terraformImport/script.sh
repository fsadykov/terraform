terraform import "kubernetes_namespace.create_namespaces[0]" "dev-students"
terraform import "kubernetes_namespace.create_namespaces[1]" "qa-students"
terraform import "kubernetes_namespace.create_namespaces[2]" "prod-students"
terraform import "kubernetes_namespace.create_namespaces[3]" "dev"
terraform import "kubernetes_namespace.create_namespaces[4]" "qa"
terraform import "kubernetes_namespace.create_namespaces[5]" "prod"
terraform import "kubernetes_namespace.create_namespaces[6]" "test"

# terraform state rm kubernetes_namespace.dev_namespace
# terraform state rm kubernetes_namespace.qa_namespace
# terraform state rm kubernetes_namespace.prod_namespace
# terraform state rm kubernetes_namespace.qa
# terraform state rm kubernetes_namespace.prod
# terraform state rm kubernetes_namespace.test
# terraform state rm kubernetes_namespace.dev

# terraform import "kubernetes_secret.nexus_creds_namespaces[0]" "dev-students/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[1]" "qa-students/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[2]" "prod-students/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[3]" "dev/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[4]" "qa/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[5]" "prod/nexus-creds"
# terraform import "kubernetes_secret.nexus_creds_namespaces[6]" "test/nexus-creds"