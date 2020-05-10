variable "environment" {
  default = "prod"
}

variable "issuer_name" {
  type = "map"
  default = {
    dev  = "letsencrypt-issuer-dev-webplatform-prod"
    qa   = "letsencrypt-issuer-qa-webplatform-prod"
    prod = "letsencrypt-issuer-prod-webplatform-prod"
  }
}

variable "dns_endpoint_webplatform" {
  type = "map"
  default = {
    dev  = "dev.academy.fuchicorp.com"
    qa   = "qa.academy.fuchicorp.com"
    prod = "academy.fuchicorp.com"
  }
}

output "cluster_issuer" {
  value = "${lookup(var.issuer_name, "${var.environment}")}"
}

output "endpoint" {
  value = "${lookup(var.dns_endpoint_webplatform, "${var.environment}")}"
}
