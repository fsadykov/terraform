
data "template_file" "docker_config_template" {
  template = "${file("${path.module}/.docker/config_template.json")}"

  vars {
    docker_endpoint = "${var.secret_config["docker_endpoint"]}"
    user_data = "${base64encode(var.secret_config["user_data"])}"
  }
}


resource "local_file" "docker_config" {
    content     = "${data.template_file.docker_config_template.rendered}"
    filename = "${path.module}/.docker/config.json"
}

resource "kubernetes_secret" "nexus_creds" {
  metadata {
    name = "nexus-example"
  }

  data = {
    ".dockerconfigjson" = "${file("${path.module}/.docker/config.json")}"
  }

  type = "kubernetes.io/dockerconfigjson"
}