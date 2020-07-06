data "template_file" "example_local_template" {
  template = "${file("template.yaml")}"

  vars {
    NODE_NAME = "$${NODE_NAME}"
    ELASTICSEARCH_HOSTS = "$${ELASTICSEARCH_HOSTS:elasticsearch-master:9200}"
  }
}

resource "local_file" "example_local_template_values" {
  content  = "${trimspace(data.template_file.example_local_template.rendered)}"
  filename = "output.yaml"
}