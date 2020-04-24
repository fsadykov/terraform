# resource "null_resource" "security_group_checker" {

#   triggers = {
#     security_groups = "${join(",", var.security_groups.*.cidr)}"

#   }

#   provisioner "local-exec" {
#     # Bootstrap script called with private_ip of each node in the clutser
#     command = "echo testing"
#   }
# }
variable "security_groups" {
  default = [
    {
      cidr = "0.0.0.0/0"
      port = "443"
    },
    {
      cidr = "0.0.0.0/32"
      port = "80"
    },
  ]
}





output "security_groups" {
  value = "${join(" ", values(var.security_groups.*.cidr))}"
}

# output "count" {
#   value = "${length(var.security_groups)}"
# }

# output "count-all" {
#   value = "${}"
# }
