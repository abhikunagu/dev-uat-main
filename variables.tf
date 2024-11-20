# Define the region variable
variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}

# Define the zone variable
variable "zone" {
  description = "The zone where resources will be deployed"
  type        = string
  default     = "us-central1-a"
}

# Define the GCP project ID variable
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

# Define the GCP service account credentials file variable
variable "credentials_file" {
  description = "Path to the GCP service account credentials JSON file"
  type        = string
}

# Define the Google Cloud Storage Bucket name
variable "bucket_name" {
  description = "The name of the GCP Storage bucket"
  type        = string
  default     = "example-tf-bucket"
}

# Define the machine type for the Compute Engine instance
variable "machine_type" {
  description = "The machine type for the Compute Engine instance"
  type        = string
  default     = "e2-medium"
}

# Define the image for the Compute Engine instance
variable "image" {
  description = "The image to use for the Compute Engine instance"
  type        = string
  default     = "debian-cloud/debian-11"
}

# Define whether to force destroy the bucket
variable "force_destroy" {
  description = "Whether to force destroy the storage bucket (use with caution)"
  type        = bool
  default     = true
}
