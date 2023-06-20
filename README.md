# redis-stack-cloudimages

This repository is responsible for creating various cloud images, containing versions of [redis-stack-server](https://github.com/redis-stack/redis-stack). It uses [packer](https://www.packer.io/) to build and provision these instances.

## Cloud Provisioners

- [AWS](aws/README.MD): This cloud provisioner documentation provides instructions for building custom images on AWS using Packer. It includes prerequisites, such as installing Packer and the required plugin, and provides details on setting up AWS access keys. Refer to the AWS documentation for more information.

- [Azure](azure/README.MD): The Azure cloud provisioner documentation explains how to build custom images on Azure using Packer. It covers prerequisites, including installing Packer and the Azure plugin, and provides guidance on setting up Azure credentials. Visit the Azure documentation for further details.

- [GCP](gcp/README.MD): The GCP cloud provisioner documentation explains how to build custom images on GCP using Packer. It covers prerequisites, including installing Packer and the GCP plugin, and provides guidance on setting up GCP credentials. Visit the GCP documentation for further details.

By following the links above, you can access the respective cloud provisioner's documentation, which will provide you with specific instructions and usage guidelines for building the corresponding cloud images.