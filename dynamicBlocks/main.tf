resource "null_resource" "name" {
  count = 2 
  provisioner "local-exec" {
    command = "echo 'Hello'"
  }
}


output name {
  value       = "${null_resource.name[1]}"
}


