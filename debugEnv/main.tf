variable "deployment_environment" {
  default     = "prod"
}


output debug {
    value = "debug=${lower(var.deployment_environment) == "dev" ? "True": "False" }"
}
