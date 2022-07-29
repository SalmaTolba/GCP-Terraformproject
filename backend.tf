terraform {
  backend "gcs" {
    bucket = "bucket1-salma-88782"
    prefix = "terraform/state"
  }
}