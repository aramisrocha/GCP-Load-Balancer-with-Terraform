# Foram criados dois templates em duas regioes diferentes

resource "google_compute_instance_template" "mytemplate-us-central1" {
  name = "aramis-pj02-central"
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
    network = "${google_compute_network.vpc-pj01.self_link}"
    subnetwork = "${google_compute_subnetwork.my_subnet_us-central1.self_link}"
  }
  
}



resource "google_compute_instance_template" "mytemplate-west1" {
  name = "aramis-pj02-west"
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
    network = "${google_compute_network.vpc-pj01.self_link}"
    subnetwork = "${google_compute_subnetwork.my_subnet_us-west1.self_link}"
  }
  
}