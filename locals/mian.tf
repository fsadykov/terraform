locals {
    service_name = "forum"
    owner        = "Community Team"
    tags = "${var.tags}"
}


variable "tags" {
    type = "map"
    default = {
        service_name = "forum"
        owner        = "Community Team"
    }
    description = "- (Optional) the map for the tags"
}

data "null_data_source" "name" {
  inputs = "${var.tags}"
}

output "name" {
  value = "${data.null_data_source.name.inputs}"
}




output "tags" {
  value = "${local.tags}"
}

output "data" {
  value = "${local.service_name}"
}

