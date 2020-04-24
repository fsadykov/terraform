data "google_container_engine_versions" "cluster_version" {
  location       = "us-central1-b"
  version_prefix = "1.15."
  project        = "gold-order-274923"
}

output "version" {
  value = "${data.google_container_engine_versions.cluster_version.latest_node_version}"
}
