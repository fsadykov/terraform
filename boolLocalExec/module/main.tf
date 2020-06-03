
 
resource "null_resource" "local" {
  count = "${lower(var.remote_chart) == "false" ? 1 : 0 }"
  provisioner "local-exec" { command = "echo 'Wokring Local chart'" }
}


resource "null_resource" "remote" {
  count = "${lower(var.remote_chart) == "true" ? 1 : 0 }"
  provisioner "local-exec" { command = "echo 'Wokring Remote chart'" }
}



variable "remote_chart" {
  default = "false"
}
