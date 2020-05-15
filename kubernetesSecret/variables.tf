variable "secret_config" {
  type = "map"

  default = {
    docker_endpoint  = "docker.fuchicorp.com"
    docker_user_data = "admin:password"
  }
  description = "- (Required) Variable is looking for <docker_endpoint> and  <docker_user_data> with following format (username:password)"
}
