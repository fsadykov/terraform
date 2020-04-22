data "null_data_source" "example" {
    inputs = {
        example = "key"
    }
  
}

output "name" {
  value = "${data.null_data_source.example.inputs}"
}

