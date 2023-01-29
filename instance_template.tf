  data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "tf-state-bucke-aramis"
    prefix = "terraform/state"
    credentials = ("C:\\Program Files (x86)\\Terraform\\first-app-project-371521-1903d04c417b.json")
  }
}

resource "google_compute_instance_template" "mytemplate" {
  name = "aramis-pj02"
  project = var.project

  machine_type = "f1-micro"
  can_ip_forward = true
  tags = ["pj02"]
  metadata_startup_script = file("startup.sh")

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1804-lts"
    auto_delete = true
    boot = true
  }

  network_interface {
    network = data.terraform_remote_state.network.google_compute_network.vpc-pj01.self_link
    access_config {
      // ephemeral IP
    }
  }
  
}