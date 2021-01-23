variable "deployment_endpoint" {
  type = "map"

  default = {
    test  = "test.food-market"
    dev  = "dev.food-market"
    qa   = "qa.food-market"
    prod = "food-market"
    stage = "stage.food-market"
  }
}

variable "google_domain_name" {
  default = "fuchicorp.com"
}

variable "deployment_environment" {
  type = "string"
  default = "dev"
}



