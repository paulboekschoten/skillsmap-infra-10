terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.8.0"
    }
  }
}

provider "acme" {
  #server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

provider "aws" {
  region = var.region
}