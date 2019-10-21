# resource "null_resource" "convert_values" {
#   provisioner "local-exec" {
#   command = <<EOF
#     echo "tcp:\n  ${var.ingress_port}: ${var.env_port}" >> helm-fuchicorp/values.yaml
#     EOF
#   }
# }
#


data "template_file" "ingress_values" {
  template = <<EOF
tcp:
  ${var.ingress_port}: "${var.env_port}"
EOF
}


resource "local_file" "web" {
  content     = "${data.template_file.ingress_values.rendered}"
  filename =  ".cache/values_nginx_ingress.yaml"
}
