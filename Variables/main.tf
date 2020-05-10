variable "name" {
  type    = "string"
  default = "instance-name"
}

variable "names" {
  type = "list"

  default = [
    "Tanya",
    "Anna",
    "Farkhod",
  ]
}


variable "instance" {
  type = "map"

  default = {
    instance_name   = "instance-tanya"
    instance_ami    = "ami-rion23egqiuwhbq2e"
    instance_subnet = "awdsawdasfawdawdawdawd"
    instance_count  = 2
  }
}

output "name" {
  value = "${var.name}"
}


resource "null_resource" "lists" {
  count = "${length(var.names)}"

  provisioner "local-exec" {
    command = "echo User name: ${var.names[count.index]} "
  }
}

variable "active" {
  default = "true"
}

output "is_application_active" {
  value = "${var.active == "true" ? "Application is active" : "Application is not active"}"
}

resource "null_resource" "instance_object" {
  count = "${var.active == "true" ? 1 : 0}"
  provisioner "local-exec" {
    command = <<EOF
        #!/bin/bash
        echo -e '''
        Instance Name:      "${var.instance["instance_name"]}"
        Instance AMI:       "${var.instance["instance_ami"]}"
        Instance Count:     "${var.instance["instance_count"]}"
        Instance Subnet:    "${var.instance["instance_subnet"]}"
        '''
        EOF
  }
}