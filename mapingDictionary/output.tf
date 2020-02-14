output "selected_configuration" {
  value = "${lookup(var.github_client_secret, "${var.deployment_environment}")}"
}


# export TF_VAR_google_project_id='1231432435234123wrfd' 