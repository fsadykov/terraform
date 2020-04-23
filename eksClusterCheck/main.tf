resource "null_resource" "cluster_autoscaler" {
  provisioner "local-exec" {
    command = <<EOF
      if [[ ${var.eks_cluster} == true ]];then
        echo "The cluster is EKS"
      else
        echo "The cluster is kops"
      fi
    EOF
  }
}

variable "eks_cluster" {
  default = "false"
}
