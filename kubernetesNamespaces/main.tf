variable "namespaces" {
  type = "list"
  default = [
      "dev-students",
      "qa-students",
      "prod-students",
      "tools"
  ]
}


resource "kubernetes_role_binding" "example" {
    count = "${length(var.namespaces)}"
    metadata {
        name      = "terraform-example"
        namespace = "${var.namespaces[count.index]}"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "Role"
        name      = "admin"
    }
    subject {
        kind      = "User"
        name      = "admin"
        api_group = "rbac.authorization.k8s.io"
    }
}