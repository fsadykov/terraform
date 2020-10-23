

resource "null_resource" "kube_dns" {
  provisioner "local-exec" {
    command = "kubectl apply -f /Users/fsadykov/DevOps/Terraform/replaceUpstreamDNS/kube-dns.yaml"
  }
}

