# AWS Packer Configuration

This Packer configuration is used to build custom images on AWS. It has two sources, `redis-stack-x86` and `redis-stack-arm`, which correspond to different architectures.

## Prerequisites

Before you can use this configuration, you will need to do the following:

1. Install [Packer](https://www.packer.io/).
2. Install the [`amazon` Packer plugin](https://github.com/hashicorp/packer-provisioner-amazon-chroot):

```packer plugin install packer-provisioner-amazon-chroot```


3. Set the following environment variables with your AWS access key and secret key:

```export AWS_ACCESS_KEY=<your access key>```
```export AWS_SECRET_KEY=<your secret key>```


## Usage

To build the images, run the following command:

```packer build -var-file=vars.pkr.hcl aws-ubuntu.pkr.hcl```


Replace `vars.pkr.hcl` with the path to a file that contains the variables for the configuration.