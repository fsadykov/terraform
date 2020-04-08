data "template_file" "example_local_template" {
  template = "${file("template.yaml")}"

  vars {
    user = "root"
    password = "Redhat2018"
  }
}

resource "local_file" "example_local_template_values" {
  content  = "${trimspace(data.template_file.example_local_template.rendered)}"
  filename = "output.yaml"
}