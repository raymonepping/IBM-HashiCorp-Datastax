# DataStax Astra Database
resource "astra_database" "main" {
  name           = var.database_name
  keyspace       = var.keyspace_name
  cloud_provider = lower(var.cloud_provider)
  regions        = var.regions

  # Explicitly allow destroy if you want to clean up
  deletion_protection = false
    
}
