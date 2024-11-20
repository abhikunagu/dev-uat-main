# Configure the GCP provider
provider "google" {
  credentials = file("<PATH_TO_SERVICE_ACCOUNT_KEY>.json") # Replace with your service account key path
  project     = "<YOUR_PROJECT_ID>"                       # Replace with your GCP project ID
  region      = "us-central1"                             # Replace with your desired region
}

# Define a Google Cloud Storage bucket
resource "google_storage_bucket" "example_bucket" {
  name          = "example-terraform-bucket-${random_id.bucket_id.hex}"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age        = 30
      with_state = "ARCHIVED"
    }
    action {
      type = "Delete"
    }
  }
}

# Generate a unique ID for the bucket name
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Define a Virtual Private Cloud (VPC) network
resource "google_compute_network" "vpc_network" {
  name                    = "example-vpc"
  auto_create_subnetworks = false
}

# Define a subnet for the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = "example-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

# Define a Compute Engine instance
resource "google_compute_instance" "example_instance" {
  name         = "example-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Debian 11 image
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {} # Assign a public IP
  }

  tags = ["web", "example"]
}

# Output instance public IP
output "instance_ip" {
  value = google_compute_instance.example_instance.network_interface[0].access_config[0].nat_ip
}

