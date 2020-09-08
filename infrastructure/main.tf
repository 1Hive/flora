// DigitalOcean configuration
variable "do_token" {
  description = "Your DigitalOcean token."
}
variable "do_region" {
  description = "The region in which the infrastructure will be deployed."
  default = "nyc3"
}

// Node configuration
variable "ssh_keys" {
  type = list(string)
  validation {
    condition = length(var.ssh_keys) > 0
    error_message = "You must specify at least one SSH key."
  }
  description = "A list of SSH key fingerprints with access to the nodes. Must be at least one."
}
variable "node_size" {
  description = "The Droplet size for the nodes."
  default = "s-1vcpu-2gb"
}

// Provider configuration
provider "digitalocean" {
  token = var.do_token
}

// Images
data "digitalocean_image" "node" {
  name = "flora-node"
}

// Tags
resource "digitalocean_tag" "validator" {
  name = "validator"
}

// Validator config
resource "template_dir" "node" {
  source_dir = "${path.module}/templates/node"
  destination_dir = "${path.cwd}/build/node"
  vars = {
    // Based on https://docs.tendermint.com/master/tendermint-core/validators.html
    // TODO: Turn this off for Sentry architecture
    pex = true
    // We can probably fetch this using https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/data_source
    // TODO: For Sentry nodes this is just the validator, for the validator it is the Sentry nodes
    persistent_peer_ids = ""
    // TODO: For Sentry nodes this is the validator node
    private_peer_ids = ""
    // TODO: For Sentry nodes it's the validator, for the validator it's the Sentry nodes
    unconditional_peer_ids = ""
  }
}

// Validator node
resource "digitalocean_droplet" "validator" {
  name = "flora-validator"
  image = data.digitalocean_image.node.image
  size = var.node_size
  region = var.do_region
  ssh_keys = var.ssh_keys
  tags = [
    digitalocean_tag.validator.id
  ]

  provisioner "file" {
    content = "${template_dir.node.destination_dir}"
    destination = "/home/node/config"
  }
}

// Outputs
output "validator_ip" {
  description = "The IPv4 address of the validator node."
  value = "${digitalocean_droplet.validator.ipv4_address}"
}
