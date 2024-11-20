# Output for the Google Cloud Storage Bucket URL
output "bucket_url" {
  description = "The URL of the Google Cloud Storage Bucket"
  value       = google_storage_bucket.example_bucket.url
}

# Output for the Compute Engine instance name
output "instance_name" {
  description = "The name of the Compute Engine instance"
  value       = google_compute_instance.example_instance.name
}

# Output for the Compute Engine instance external IP
output "instance_ip" {
  description = "The external IP address of the Compute Engine instance"
  value       = google_compute_instance.example_instance.network_interface[0].access_config[0].nat_ip
}

# Output for the project ID
output "project_id" {
  description = "The GCP Project ID"
  value       = var.project_id
}

# Output for the region
output "region" {
  description = "The region where resources are being created"
  value       = var.region
}

# Output for the zone
output "zone" {
  description = "The zone where resources are being created"
  value       = var.zone
}
