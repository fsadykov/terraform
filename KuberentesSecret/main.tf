


variable "user_info" {
	type = "map"
}


resource "kubernetes_secret" "github_access_token" {
  metadata {
    name = "github-access-token"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Example"
    }

    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.user_info["username"]}"
    "password" = "${var.user_info["password"]}"
  }
}


resource "kubernetes_secret" "github_access_token_example" {
  metadata {
    name = "github-access-token-example"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Example"
    }

    labels {
        "jenkins.io/credentials-type" = "secretText"
    }
  }

  data = {
    "text" = "${var.user_info["password"]}"
  }
}