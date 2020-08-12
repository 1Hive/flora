# Flora

Reproducible infrastructure for Ethermint validators.

## Requirements

- [Terraform](https://terraform.io/)
- [Packer](https://www.packer.io/)

## Build images

To build the images used for the machines run the provided build script (`bin/build`).

In order to successfully build, you need to specify the following environment variables

- **`DO_TOKEN`**: Your DigitalOcean API token
- **`DO_REGION`**: A valid DigitalOcean region slug where the built image will be available
  and the build droplet will run.

