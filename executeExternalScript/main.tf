data "external" "example" {
  program = ["python", "${path.module}/generate-data.py"]

  query = {
    id = "123123"
  }
}


output "example" {
    value = "This is example output"
}