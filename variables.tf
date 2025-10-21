variable "astra_token" {
  description = "Astra API token. Prefer env ASTRA_API_TOKEN or HCP Variable Set."
  type        = string
  sensitive   = true
  default     = ""
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
  description = "Cloud provider: aws, gcp, or azure."
  type        = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], lower(var.cloud_provider))
    error_message = "cloud_provider must be one of: aws, gcp, azure."
  }
}

variable "regions" {
  description = "List of regions. Example: [\"eu-west-1\"]."
  type        = list(string)
  validation {
    condition     = length(var.regions) >= 1
    error_message = "regions must include at least one region."
  }
}
