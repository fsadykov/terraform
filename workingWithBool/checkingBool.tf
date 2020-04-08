resource "null_resource" "convert_values" {
    count = "${var.china == "true" ? 1 : 0}"
  provisioner "local-exec" {
  command = <<EOF
    echo "Hello world"
    EOF
  }
}