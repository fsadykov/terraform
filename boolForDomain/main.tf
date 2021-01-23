output "Application endpoint" {
  value    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}










output "is_domain_prod" {
    value = "${lower(var.deployment_environment) == "prod" ? "Yes this is prod " : "Nope this is not prod env" }"
}
