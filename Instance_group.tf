resource "google_compute_instance_group_manager" "my-instance-group-pj02" {
  name = "my-instance-group-pj02"
  project = var.project
  zone = "us-central1-a"
  base_instance_name = "my-instance-group-pj02"
  target_size = 2
  version {
    instance_template = "${google_compute_instance_template.mytemplate.self_link}"
    name = "my-version"
  }
  named_port {
    name = "http"
    port = 80
  }
}