# Remove mute button plugin

The example deploys a Flex plugin to Twilio Serverless Assets

## Pre-requisites

To be able to build and deploy this example you need the following:

- [Twilio Account](https://www.twilio.com/)
- [Terraform](https://www.terraform.io/) (v0.14 or above)
- [Node JS](https://nodejs.org/en/download/current/)
- [Yarn](https://classic.yarnpkg.com/en/docs/install) (Optional)

## Deploying the example

To deploy the plugin to Twilio, you need to build the plugin locally. To build the plugin you need to install the dependencies. You can use one of the following commands:

```bash
npm install
```

or

```bash
yarn install
```

Once the dependencies have been downloaded, the plugin's need to be built. You can run the build using one of the following commands:

```bash
npm run build
```

or

```bash
yarn build
```

Now the artifacts have been built they can be deployed using Terraform. First, you need to download the providers and module, you can do this by running the following command:

```bash
terraform init
```

To see what changes will be made, you can run the following command:

```bash
terraform plan
```

To deploy the Serverless service and assets, you can run the following command:

```bash
terraform apply
```

When you see the following

```txt
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

type `yes` and hit the return/ enter key. Alternatively, if you don't want the manual accept process you can run the following command:

```bash
terraform apply -auto-approve
```

## Destroying the example

Once you are finished with the resources you can remove all the provisioned resources by running the following command:

```bash
terraform destroy
```

When you see the following

```txt
Do you want to perform these actions?
 Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

type `yes` and hit the return/ enter key. Alternatively, if you don't want the manual accept process you can run the following command:

```bash
terraform destroy -auto-approve
```

Then all the resources (which Terraform has state information for) should be removed.

## Terraform docs

### Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.14   |
| twilio    | >= 0.11.0 |

### Providers

| Name   | Version   |
| ------ | --------- |
| twilio | >= 0.11.0 |

### Modules

| Name                      | Source | Version |
| ------------------------- | ------ | ------- |
| plugin_remove_mute_button | ../../ |         |

### Resources

| Name                                                                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------- |
| [twilio_serverless_service](https://registry.terraform.io/providers/RJPearson94/twilio/0.11.0/docs/resources/serverless_service) |

### Inputs

No input.

### Outputs

No output.
