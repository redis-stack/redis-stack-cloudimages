# GCP Packer Configuration

This Packer configuration can be used to build custom images on GCP. The configuration builds two images, one for x86 architectures and one for ARM architectures.

## Prerequisites

Before you can use this configuration, you will need to do the following:

1. Install [Packer](https://www.packer.io/).
2. Install the [`googlecompute` Packer plugin](https://github.com/hashicorp/packer-provisioner-googlecompute):

```packer plugin install packer-provisioner-googlecompute```

3. [Create a service account](#creating-a-service-account) on GCP and download a JSON file with the credentials.
4. Set the following environment variables:

```export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service_account.json"```

## Creating a Service Account

To create a service account on GCP, follow these steps:

1. Go to the [IAM & Admin](https://console.cloud.google.com/iam-admin/iam) page in the Cloud Console.
2. Click the `Create service account` button.
3. Enter a name and description for the service account.
4. Select `Furnish a new private key` and choose the `JSON` key type.
5. Click the `Create` button.
6. Save the JSON file with the credentials to a secure location.

## Usage

To build the images, run the following command:

```packer build -var-file=vars.pkr.hcl gcp-ubuntu.pkr.hcl```


Replace `vars.pkr.hcl` with the path to a file that contains the variables for the configuration. 
