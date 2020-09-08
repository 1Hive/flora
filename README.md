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

## Deploy infrastructure

To deploy the infrastructure use Terraform directly or the provided helper script (`bin/deploy`).

For now you need to generate keys for the validator and put these keys in the `data` directory.

```sh
ethermintcli keys add $KEY --algo "eth_secp256k1"
```

Each keyfile should retain their original name as specified by Ethermint.

Furthermore, you will also need to either [create a genesis file](https://docs.ethermint.zone/quickstart/testnet.html#genesis-procedure) or [fetch one](https://docs.ethermint.zone/quickstart/testnet.html#copy-the-genesis-file) for the network you want to operate on.

Parts of this procedure might be automated in the future.

## Full example

```sh
# Generate the genesis file

# Generate the keys

# Build images and deploy the infrastructure
DO_TOKEN=my-token DO_REGION=nyc3 ./bin/deploy
```
