resource "kubernetes_namespace" "create_namespaces" {
  count = "${length(var.namespaces)}"
    metadata {
        name      = "${var.namespaces[count.index]}"
    }
}


# resource "kubernetes_namespace" "example" {
#     metadata {
#         name      = "dev"
#     }
# }
variable "namespaces" {
  type = "list"
  default = [
    "dev-students",
    "qa-students",
    "prod-students",
    "dev",
    "qa",
    "prod",
    "test"
  ]
}

