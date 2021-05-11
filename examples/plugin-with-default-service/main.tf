resource "twilio_serverless_service" "service" {
  unique_name   = "default"
  friendly_name = "Default Flex Plugin Service"
}

module "plugin_remove_mute_button" {
  source = "../../"

  service_sid = twilio_serverless_service.service.sid
  plugin_name = "plugin-remove-mute-button"
  base_path   = "${path.module}/build"
}
