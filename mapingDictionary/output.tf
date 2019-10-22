output "selected_configuration" {
  value = "${lookup(var.github_client_secret, "${var.deployment_environment}")}"
}
