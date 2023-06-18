# Azure Packer Configuration

This Packer configuration is used to build custom images on Azure. It utilizes the `azure-arm` builder and has a single source, `redis-stack-x64`, which is designed for x64 architecture.

## Prerequisites

Before you can use this configuration, make sure you have the following prerequisites in place:

1. Install [Packer](https://www.packer.io/).
2. Install the [`azure` Packer plugin](https://github.com/hashicorp/azure) by running the following command:


3. Set up the necessary environment variables with your Azure credentials:

```bash
export ARM_CLIENT_ID=<your client ID>
export ARM_CLIENT_SECRET=<your client secret>
export ARM_SUBSCRIPTION_ID=<your subscription ID>
export ARM_TENANT_ID=<your tenant ID>
```

## Usage

To build the Azure image, execute the following command:

```
packer build -var-file=vars.pkr.hcl azure-ubuntu.pkr.hcl
```

Make sure to replace vars.pkr.hcl with the path to a file that contains the variables required for the configuration.