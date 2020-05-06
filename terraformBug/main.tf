variable "environment" {
    default = "dev-fsadykov"
}

module "master_ips" {
  source  = "matti/outputs/shell"
  command = "kubectl get nodes --selector=kubernetes.io/role==master -o jsonpath={.items[*].status.addresses[?\\(@.type==\\\"InternalIP\\\"\\)].address} | xargs -I{} echo 'none' {} "
}

variable "env_base_domain" {
    default = "example.com"
}


output "k8s_env_name" {
  value = "${lower(var.environment)}.${lower(var.env_base_domain)}"
}

output "master-ips" {
  value = "${module.master_ips.stdout}"
}
