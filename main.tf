provider "astra" {
  # Token can be set via environment variable ASTRA_API_TOKEN
  # or via the token argument below
  token = var.astra_token
}

# DataStax Astra Database
resource "astra_database" "main" {
  name           = var.database_name
  keyspace       = var.keyspace_name
  cloud_provider = lower(var.cloud_provider)
  regions        = var.regions
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

output "database_regions" {
  description = "The regions of the Astra database"
  value       = astra_database.main.regions
}

output "database_keyspace" {
  description = "The keyspace of the Astra database"
  value       = astra_database.main.keyspace
}

output "database_cloud_provider" {
  description = "The cloud provider of the Astra database"
  value       = astra_database.main.cloud_provider
}

output "database_organization_id" {
  description = "The organization ID of the Astra database"
  value       = astra_database.main.organization_id
}

output "database_cqlsh_url" {
  description = "The CQL shell URL for connecting to the database"
  value       = astra_database.main.cqlsh_url
}

output "database_data_endpoint_url" {
  description = "The data endpoint URL for connecting to the database"
  value       = astra_database.main.data_endpoint_url
}

output "database_grafana_url" {
  description = "The Grafana URL for monitoring the database"
  value       = astra_database.main.grafana_url
}

output "database_graphql_url" {
  description = "The GraphQL URL for the database"
  value       = astra_database.main.graphql_url
}
