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

resource "google_compute_address" "static" {
  name = "ipv4-address"
  project     = "first-app-project-371521"
}



# Crie uma máquina virtual chamada "vm-1"
resource "google_compute_instance" "vm-1" {
  name         = "vm-1"
  project     = "first-app-project-371521"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc-pj01.name
    subnetwork   = google_compute_subnetwork.my_subnet_us-central1.self_link
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}

# Crie uma máquina virtual chamada "vm-2"
resource "google_compute_instance" "vm-2" {
  name         = "vm-2"
  project     = "first-app-project-371521"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc-pj01.name
    subnetwork   = google_compute_subnetwork.my_subnet_us-west1.self_link
  }
}

output "vpc_pj01_self_link" {
  value = google_compute_network.vpc-pj01.self_link
}
