resource "null_resource" "name" {

  provisioner "local-exec" {
    command = "echo 'Hello from hehhe ${var.username}'"
  }
}

# resource "null_resource" "name" {

#   provisioner "local-exec" {
#     command = "echo 'Hello from ${var.username}'"
#   }
# }



# ~/.kube/config 