# terraform-twilio-flex-plugin

This is a terraform module for managing a Twilio Flex plugin using Twilio Serverless Assets

This module uses the community Twilio Terraform Provider (also maintained by the module [author](https://github.com/RJPearson94))

- [Terraform Registry](https://registry.terraform.io/providers/RJPearson94/twilio/latest)
- [Github](https://github.com/RJPearson94/terraform-provider-twilio)

~> **Disclaimer:** This project is not an official Twilio project and is not supported or endorsed by Twilio in any way. It is maintained in [my](https://github.com/RJPearson94) free time.

**NOTE:** The default branch for this project is called `main`

## Examples

Examples of how the Terraform module can be used can be found [here](./examples)

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.14   |
| twilio    | >= 0.11.0 |

## Providers

| Name   | Version   |
| ------ | --------- |
| random | n/a       |
| twilio | >= 0.11.0 |

## Modules

No Modules.

## Resources

| Name                                                                                                                                     |
| ---------------------------------------------------------------------------------------------------------------------------------------- |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                   |
| [twilio_serverless_asset](https://registry.terraform.io/providers/RJPearson94/twilio/0.11.0/docs/resources/serverless_asset)             |
| [twilio_serverless_build](https://registry.terraform.io/providers/RJPearson94/twilio/0.11.0/docs/resources/serverless_build)             |
| [twilio_serverless_deployment](https://registry.terraform.io/providers/RJPearson94/twilio/0.11.0/docs/resources/serverless_deployment)   |
| [twilio_serverless_environment](https://registry.terraform.io/providers/RJPearson94/twilio/0.11.0/docs/resources/serverless_environment) |

## Inputs

| Name                      | Description                                                                                                                     | Type                                                                    | Default       | Required |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------- | :------: |
| base_path                 | The path to the plugin build artifacts                                                                                          | `string`                                                                | n/a           |   yes    |
| domain_suffix_length      | The length of the random string which is generated for the domain suffix                                                        | `number`                                                                | `6`           |    no    |
| include_sourcemap         | Whether to include the sourcemap as an asset                                                                                    | `bool`                                                                  | `true`        |    no    |
| plugin_artifact           | Override the default plugin asset configuration                                                                                 | <pre>object({<br> source = string<br> source_hash = string<br> })</pre> | `null`        |    no    |
| plugin_name               | Name of the Flex plugin. The plugin name should start with `plugin-`                                                            | `string`                                                                | n/a           |   yes    |
| plugin_sourcemap_artifact | Override the default plugin sourcemap asset configuration. Only applicable when the `include_sourcemap` variable is set to true | <pre>object({<br> source = string<br> source_hash = string<br> })</pre> | `null`        |    no    |
| service_sid               | Twilio Serverless Service SID                                                                                                   | `string`                                                                | n/a           |   yes    |
| version_number            | The version number of the Flex plugin                                                                                           | `string`                                                                | `"0.0.0"`     |    no    |
| visibility                | The visibility of the Flex plugin                                                                                               | `string`                                                                | `"protected"` |    no    |

## Outputs

| Name                      | Description                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------ |
| flex_plugin_sourcemap_url | The URL for the Flex Plugin Sourcemap. This output will be null if the `include_sourcemap` variable is false |
| flex_plugin_url           | The URL for the Flex Plugin                                                                                  |

## Post-deployment

If you deploy the Flex plugins under a non `default` service (a Serverless service that has the unique name of `default`) then you will need to updated the Flex configuration to integrate the Serverless service and load the Flex plugins into the Flex instance.

You can you the CURL request below to update the Flex configuration.

```bash
curl -X POST 'https://flex-api.twilio.com/v1/Configuration' \
    -u ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:your_auth_token
    -H 'Content-Type: application/json' \
    -d '{
        "account_sid": "<<account_sid>>",
        "serverless_service_sids": ["<<serverless_service_sid>>"]
    }'
```
