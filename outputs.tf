output "flex_plugin_url" {
  description = "The URL for the Flex Plugin"
  value       = "https://${twilio_serverless_environment.environment.domain_name}${twilio_serverless_asset.plugin.path}"
}

output "flex_plugin_sourcemap_url" {
  description = "The URL for the Flex Plugin Sourcemap. This output will be null if the `include_sourcemap` variable is false"
  value       = var.include_sourcemap ? "https://${twilio_serverless_environment.environment.domain_name}${twilio_serverless_asset.plugin_sourcemap[0].path}" : null
}
