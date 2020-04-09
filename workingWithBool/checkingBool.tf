resource "null_resource" "china_false" {
    count = "${var.china_environment == "true" ? 0 : 1}"
  provisioner "local-exec" {
  command = <<EOF
    echo "Hello world"
    EOF
  }
}

resource "null_resource" "china_true" {
    count = "${var.china_environment == "true" ? 1 : 0}"
  provisioner "local-exec" {
  command = <<EOF
    echo "The environment is China"
    EOF
  }
}

resource "null_resource" "shel_checking" {
  provisioner "local-exec" {
  command = <<EOF
    #!/bin/bash
    ENVIRONMENT="true"
    if [[ "${var.china_environment}" == "false" ]]; then
        echo "Environment is US"
    fi
    EOF
  }
}