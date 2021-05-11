locals {
  asset_version_sids = compact([
    twilio_serverless_asset.plugin.latest_version_sid,
    join("", twilio_serverless_asset.plugin_sourcemap.*.latest_version_sid),
  ])
}

resource "twilio_serverless_asset" "plugin" {
  service_sid   = var.service_sid
  friendly_name = var.plugin_name
  source        = var.plugin_artifact != null ? var.plugin_artifact.source : "${var.base_path}/${var.plugin_name}.js"
  source_hash   = var.plugin_artifact != null ? var.plugin_artifact.source_hash : filemd5("${var.base_path}/${var.plugin_name}.js")
  content_type  = "application/javascript"
  path          = "/plugins/${var.plugin_name}/${var.version_number}/bundle.js"
  visibility    = var.visibility
}

resource "twilio_serverless_asset" "plugin_sourcemap" {
  count         = var.include_sourcemap ? 1 : 0
  service_sid   = var.service_sid
  friendly_name = var.plugin_name
  source        = var.plugin_sourcemap_artifact != null ? var.plugin_sourcemap_artifact.source : "${var.base_path}/${var.plugin_name}.js.map"
  source_hash   = var.plugin_sourcemap_artifact != null ? var.plugin_sourcemap_artifact.source_hash : filemd5("${var.base_path}/${var.plugin_name}.js.map")
  content_type  = "application/javascript"
  path          = "/plugins/${var.plugin_name}/${var.version_number}/bundle.js.map"
  visibility    = var.visibility
}

resource "twilio_serverless_build" "build" {
  service_sid = var.service_sid

  dynamic "asset_version" {
    for_each = local.asset_version_sids
    content {
      sid = asset_version.value
    }
  }

  polling {
    enabled = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_string" "random" {
  length  = var.domain_suffix_length
  special = false
}

resource "twilio_serverless_environment" "environment" {
  service_sid   = var.service_sid
  unique_name   = var.plugin_name
  domain_suffix = random_string.random.result
}

resource "twilio_serverless_deployment" "deployment" {
  service_sid     = var.service_sid
  environment_sid = twilio_serverless_environment.environment.sid
  build_sid       = twilio_serverless_build.build.sid

  lifecycle {
    create_before_destroy = true
  }
}
