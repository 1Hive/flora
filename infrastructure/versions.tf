terraform {
  required_providers {
    digitalocean = {
      source = "terraform-providers/digitalocean"
    }
    template = {
      source = "hashicorp/template"
    }
  }
  required_version = ">= 0.13"
}
