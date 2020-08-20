variable "mysql" {
    type = "map"
}

variable "environment" {
    default = "prod"
}

output "mysql" {
  value =  "${lookup(var.mysql[var.environment], "mysql_user")}"
}

output "mysql_password" {
  value =  "${lookup(var.mysql[var.environment], "mysql_password")}"
}

#  "${lookup(var.mysql[var.environment],"mysql_user")}"


