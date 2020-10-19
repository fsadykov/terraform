resource "kubernetes_secret" "common_tools_config" {
  metadata {
    name = "common-tools-config"
    namespace = "tools"

    labels = {
      "jenkins.io/credentials-type" = "secretFile"
      
    }

    annotations = {
      "jenkins.io/credentials-description" = "Common tools config"
    }
  }
  
  data = {
    filename = "common-tools.tfvars"
    "data" =  "${file("common-tools.tfvars")}"
  }

}



