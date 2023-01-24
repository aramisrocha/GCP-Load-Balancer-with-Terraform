provider "google" {
  credentials = file("C:\\Program Files (x86)\\Terraform\\first-app-project-371521-1903d04c417b.json")
  project     = "first-app-project-371521"
  region      = var.region
}


