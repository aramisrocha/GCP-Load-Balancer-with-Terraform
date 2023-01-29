resource "google_compute_network" "vpc-pj01" {
    name        = "vpc-pj01"
    project     = "first-app-project-371521"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "my_subnet_us-central1" {
  name          = "my-subnet-us-central1"
  project     = "first-app-project-371521"
  network       = google_compute_network.vpc-pj01.self_link
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "my_subnet_us-west1" {
  name          = "my-subnet-us-west1"
  project     = "first-app-project-371521"
  network       = google_compute_network.vpc-pj01.self_link
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-west1"
  private_ip_google_access = true 
}

resource "google_compute_firewall" "allow_internet_acces" {
    name = "allow-internet-acces"
    project     = "first-app-project-371521"
    network = google_compute_network.vpc-pj01.self_link

    allow {
        protocol = "tcp"
        ports  = ["1-65535"]
    }

  source_ranges = ["0.0.0.0/0"]
}


