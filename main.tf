terraform {
  required_version = ">= 1.0"
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = "~> 2.0"
    }
  }
}

provider "astra" {
  # Token can be set via environment variable ASTRA_API_TOKEN
  # or via the token argument below
  # token = var.astra_token
}

# DataStax Astra Database
resource "astra_database" "main" {
  name           = var.database_name
  keyspace       = var.keyspace_name
  cloud_provider = var.cloud_provider
  region         = var.region
  user_email     = var.user_email
  
  # One PCU configuration
  capacity_units = 1
  
  # Optional: Enable serverless scaling
  serverless_scaling {
    min_capacity_units = 1
    max_capacity_units = 1
  }
  
  # Optional: Enable continuous backup
  continuous_backup = var.enable_continuous_backup
  
  # Optional: Enable streaming
  streaming = var.enable_streaming
  
  tags = var.tags
}

# Optional: Create a token for the database
resource "astra_token" "main" {
  count = var.create_token ? 1 : 0
  
  database_id = astra_database.main.id
  roles       = var.token_roles
}

# Output the database information
output "database_id" {
  description = "The ID of the Astra database"
  value       = astra_database.main.id
}

output "database_name" {
  description = "The name of the Astra database"
  value       = astra_database.main.name
}

output "database_status" {
  description = "The status of the Astra database"
  value       = astra_database.main.status
}

output "database_region" {
  description = "The region of the Astra database"
  value       = astra_database.main.region
}

output "database_keyspace" {
  description = "The keyspace of the Astra database"
  value       = astra_database.main.keyspace
}

output "database_cloud_provider" {
  description = "The cloud provider of the Astra database"
  value       = astra_database.main.cloud_provider
}

output "database_capacity_units" {
  description = "The capacity units of the Astra database"
  value       = astra_database.main.capacity_units
}

output "database_org_id" {
  description = "The organization ID of the Astra database"
  value       = astra_database.main.org_id
}

output "database_secure_bundle_url" {
  description = "The secure bundle URL for connecting to the database"
  value       = astra_database.main.secure_bundle_url
}

output "token" {
  description = "The generated token for the database (if created)"
  value       = var.create_token ? astra_token.main[0].token : null
  sensitive   = true
}
