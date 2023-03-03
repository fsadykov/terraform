
locals {
    deploy_istio    = true

    istio_version = "v1.16.0"
    

    istio_helm_release = {
        istio_base = {
            name       = "istio-base"
            repository = "https://istio-release.storage.googleapis.com/charts"
            chart      = "base"
            version    = local.istio_version
            values     = <<EOF
            EOF
        }

        istiod = {
            name       = "istiod"
            repository = "https://istio-release.storage.googleapis.com/charts"
            chart      = "istiod"
            version    = local.istio_version
            values     = <<EOF
            EOF
        }

        istio_ingress = {
            name       = "ingressgateway"
            repository = "https://istio-release.storage.googleapis.com/charts"
            chart      = "gateway"
            version    = local.istio_version
            values     = <<EOF
            kind: DaemonSet
            EOF
        }
    }
}


resource "null_resource" "this" {
    for_each               = { for k, v in merge(local.istio_helm_release, {}) : k => v if local.deploy_istio }
    provisioner "local-exec" {
        # try(each.value.name, null)
        command = <<EOF
        cat <<EOD > "${each.value.name}.txt"
        Name of the helm chart: ${each.value.name}
        URL of the helm chart: ${each.value.repository}
        version of the helm chart: ${each.value.version}
        Values of the helm chart: ${each.value.values}
        EOD
        EOF
    }
  
}


output "main" {
  value       = var.main
}



variable "main" {
    type = any
    default = {}
}