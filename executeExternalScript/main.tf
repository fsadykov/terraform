data "external" "example" {
  program = ["python", "${path.module}/generate-data.py"]

  query = {
    id = "
  }
}