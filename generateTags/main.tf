variable "deployment_environment" {
  default = "dev"
}

data "external" "git_info" {
  program = ["bash", "-c", <<EOF
    terraform_version=$(terraform version -json | jq -r '.terraform_version')
    platform=$(terraform version -json | jq -r '.platform')
    terraform_outdated=$(terraform version -json | jq -r '.terraform_outdated')
    echo '{'
    echo '"timestamp": "'$(date +%Y-%m-%dT%H:%M:%S%z)'",'
    echo '"git_commit_hash": "'$(git rev-parse HEAD)'",'
    echo '"git_remote": "'$(git remote -v | head -n 1 | awk '{print $2}')'",'
    echo '"git_branch": "'$(git branch --show-current)'",'
    echo '"terraform_version": "'$terraform_version'",'
    echo '"platform": "'$platform'",'
    echo '"terraform_outdated": "'$terraform_outdated'"'
    echo '}'
  EOF
  ]
}

locals {
  settings = {
    tags = merge({ environment = var.deployment_environment }, data.external.git_info.result)
  }
}

output "tags" {
  value = local.settings.tags
}

