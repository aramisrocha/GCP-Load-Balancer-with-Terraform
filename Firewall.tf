resource "google_compute_firewall" "allow_internet_acces-pj02" {
    name = "allow-internet-acces-pj02"
    project     = var.project
    network = "default"

    allow {
        protocol = "tcp"
        ports  = ["80"]
    }
source_ranges = ["0.0.0.0/0"]
}