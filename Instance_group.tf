resource "google_compute_instance_group_manager" "my-instance-group-pj02-central1" {
  name = "my-instance-group-pj02-central1"
  project = var.project
  zone = "us-central1-a"
  base_instance_name = "my-instance-group-pj02"
  target_size = 1
  version {
    instance_template = "${google_compute_instance_template.mytemplate-us-central1.self_link}"
    name = "my-version"
  }
  named_port {
    name = "http"
    port = "80"
  }
}



resource "google_compute_instance_group_manager" "my-instance-group-pj02-west1" {
  name = "my-instance-group-pj02-west1"
  project = var.project
  zone = "us-west1-a"
  base_instance_name = "my-instance-group-pj02"
  target_size = 1
  version {
    instance_template = "${google_compute_instance_template.mytemplate-west1.self_link}"
    name = "my-version"
  }
  named_port {
    name = "http"
    port = "80"
  }
}