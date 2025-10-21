provider "astra" {
  # If astra_token is empty, let the provider pick up ASTRA_API_TOKEN from the environment.
  token = var.astra_token == "" ? null : var.astra_token
}