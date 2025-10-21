variable "database_name" {
  description = "Name of the Astra database"
  type        = string
  default     = "my-astra-db"
}

variable "keyspace_name" {
  description = "Name of the keyspace to create"
  type        = string
  default     = "mykeyspace"
}

variable "cloud_provider" {
  description = "Cloud provider for the database (AWS, GCP, or AZURE)"
  type        = string
  default     = "AWS"
  
  validation {
    condition     = contains(["AWS", "GCP", "AZURE"], var.cloud_provider)
    error_message = "Cloud provider must be one of: AWS, GCP, AZURE."
  }
}

variable "regions" {
  description = "List of regions for the database"
  type        = list(string)
  default     = ["us-east-1"]
}

variable "astra_token" {
  description = "Astra API token (can also be set via ASTRA_API_TOKEN environment variable)"
  type        = string
  default     = null
  sensitive   = true
}
