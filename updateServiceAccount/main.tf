variable "environments" {
    default =  [
        "dev",
        "default",
        "prod"
    ]
}

resource "null_resource" "full_cluster" {
  triggers {
    template = "${join("\n", var.environments)}"
  }

  provisioner "local-exec" {
    command =<<EOF
    #!/bin/bash
    for namespace in $(echo "${null_resource.full_cluster.triggers.template}")
    do
        kubectl apply -f templates/service-account.yaml -n $namespace
    done
    EOF
  }
}