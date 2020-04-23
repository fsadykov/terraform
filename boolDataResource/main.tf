data "template_file" "cluster" {
  template = "${file("templates/cluster.yaml")}"

  vars {
    cluster_fqdn      = "${var.cluster_fqdn}"
    ssh_aws_keyname   = "dev-key"
    china_environment = "${var.china_environment}"
  }
}

data "template_file" "china_cluster" {
  template = "${file("templates/china-cluser.yaml")}"

  vars {
    cluster_fqdn      = "${var.cluster_fqdn}"
    ssh_aws_keyname   = "dev-key"
    china_environment = "${var.china_environment}"
  }
}


locals {
  all_tpls = [
    "${var.china_environment == "true" ? data.template_file.china_cluster.rendered : data.template_file.cluster.rendered}"
  ]
}


locals {
  all_tpls_full = "${join("\n---\n", local.all_tpls)}"
}

resource "null_resource" "full_cluster" {
  triggers {
    template = "${md5(local.all_tpls_full)}"
  }

  provisioner "local-exec" {
    command = "${format("cat <<\"EOF\" > \"%s\"\n%s\nEOF", "full.yaml", local.all_tpls_full)}"
  }
}

output "cluster_issuer" {
  value = "\n${local.all_tpls_full}"
}

