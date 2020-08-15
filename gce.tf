# Create VPC network
resource "google_compute_network" "vpc-network" {
  project = google_project.data-lake.project_id
  name = "vpc-network"
  depends_on = [google_project_service.data-lake-service]
}

# Create static external IP address
resource "google_compute_address" "orchestration-ip-static" {
  project = google_project.data-lake.project_id
  region = local.region
  name = "${local.unique_id}-external-ip"
  depends_on = [google_project_service.data-lake-service]
}

# Create orchestration instance
resource "google_compute_instance" "orchestration" {
  project      = google_project.data-lake.project_id
  zone         = "${local.region}-a"
  name         = "orchestration"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20200701"
    }
  }
  network_interface {
    network = google_compute_network.vpc-network.name
    access_config {
        nat_ip = google_compute_address.orchestration-ip-static.address
    }
  }
  depends_on = [google_project_service.data-lake-service, google_compute_address.orchestration-ip-static, google_compute_network.vpc-network]
}

