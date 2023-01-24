terraform {
  backend "gcs" {
    bucket      = "tf-state-bucke-aramis"
    prefix      = "terraform/state"
    credentials = ("C:\\Program Files (x86)\\Terraform\\first-app-project-371521-1903d04c417b.json")
  }
}