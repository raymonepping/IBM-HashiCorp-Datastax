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
  description = "Astra API token (can also be set via ASTRA_API_TOKEN environment variable) or ideally through HashiCorp Vault"
  type        = string
  default     = null
  sensitive   = true
}

variable "database_name" {
  description = "Astra DB name."
  type        = string
  validation {
    condition     = length(var.database_name) > 0
    error_message = "database_name must not be empty."
  }
}

variable "keyspace_name" {
  description = "Primary keyspace name."
  type        = string
  validation {
    condition     = length(var.keyspace_name) > 0
    error_message = "keyspace_name must not be empty."
  }
}

variable "cloud_provider" {
  description = "Cloud provider for Astra (e.g., aws, gcp, azure)."
  type        = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], lower(var.cloud_provider))
    error_message = "cloud_provider must be one of: aws, gcp, azure."
  }
}

variable "regions" {
  description = "List of regions to deploy the database into. Example: [\"eu-west-1\"]."
  type        = list(string)
  validation {
    condition     = length(var.regions) >= 1
    error_message = "regions must include at least one region."
  }
}