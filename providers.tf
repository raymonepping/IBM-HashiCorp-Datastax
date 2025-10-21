provider "astra" {
  # Prefer environment ASTRA_API_TOKEN in CI/HCP; fallback to var.astra_token for local.
  token = var.astra_token != "" ? var.astra_token : (try(env.ASTRA_API_TOKEN, ""))
}
