variable "service_sid" {
  description = "Twilio Serverless Service SID"
  type        = string
}

variable "plugin_name" {
  description = "Name of the Flex plugin. The plugin name should start with `plugin-`"
  type        = string
}

variable "base_path" {
  description = "The path to the plugin build artifacts"
  type        = string
}

variable "version_number" {
  description = "The version number of the Flex plugin"
  type        = string
  default     = "0.0.0"
}

variable "visibility" {
  description = "The visibility of the Flex plugin"
  type        = string
  default     = "protected"
}

variable "domain_suffix_length" {
  description = "The length of the random string which is generated for the domain suffix"
  type        = number
  default     = 6
}

variable "plugin_artifact" {
  description = "Override the default plugin asset configuration"
  type = object({
    source      = string
    source_hash = string
  })
  default = null
}

variable "include_sourcemap" {
  description = "Whether to include the sourcemap as an asset"
  type        = bool
  default     = true
}

variable "plugin_sourcemap_artifact" {
  description = "Override the default plugin sourcemap asset configuration. Only applicable when the `include_sourcemap` variable is set to true"
  type = object({
    source      = string
    source_hash = string
  })
  default = null
}
