#  Ip de reserva
resource "google_compute_global_address" "default" {
  name     = "ipj03"
}

# Regas de forward
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "fw03"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}

# http proxy
resource "google_compute_target_http_proxy" "default" {
  name     = "http-proxy-pj03"
  url_map  = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = "urlpj03"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_backend_service" "default" {
  name                    = "bkpj03"
  protocol                = "HTTP"
  port_name               = "my-port"
  load_balancing_scheme   = "EXTERNAL"
  timeout_sec             = 30
  enable_cdn              = false
  #custom_request_headers  = ["X-Client-Geo-Location: {client_region_subdivision}, {client_city}"]
  #custom_response_headers = ["X-Cache-Hit: {cdn_cache_status}"]
  health_checks           = [google_compute_health_check.default.id]
  backend {
    group           = google_compute_instance_group_manager.my-instance-group-pj02-central1.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
  backend {
    group           = google_compute_instance_group_manager.my-instance-group-pj02-west1.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}


resource "google_compute_health_check" "default" {
  name     = "hc-pj03"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}