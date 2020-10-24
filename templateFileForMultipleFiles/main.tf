variable "grafana_dashboard_filenames" {
  default = [
    "cert-manager-dashboard.json",
    "ingress-controller.json",
    "jenkins-dashboard.json",
    "kubernetes-dashboard.json",
    "nexus-dashboard.json",
    "sonarqube-dashboard.json",
    "vault-dashboard.json",
    "external-dns-dashboard.json",
    ]
}

data "template_file" "dashboards" {
  count     = "${length(var.grafana_dashboard_filenames)}"
  template  = "${file("grafana_dashboards/${var.grafana_dashboard_filenames[count.index]}")}"
  vars {
    GOOGLE_DOMAIN_NAME = "fuchicorp.com"
  }
}

resource "local_file" "output_dashboards" {
    count       = "${length(var.grafana_dashboard_filenames)}"
    content     = "${element(data.template_file.dashboards.*.rendered, count.index)}"
    filename    = "${"output/${var.grafana_dashboard_filenames[count.index]}"}"
}
