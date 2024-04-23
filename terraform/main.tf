# Define required providers
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  auth_url = "https://console.cloud.ntua.gr:5000"
  region   = "KHY"
}

variable "vm_name" {
  type    = string
  default = "my-vm"
}

variable "key_name" {
  type    = string
  default = "my-key"
}

data "openstack_images_image_v2" "ubuntu" {
  name        = "ubuntu-22.04"
  most_recent = true
}

data "openstack_compute_flavor_v2" "small" {
  name = "m1.small"
}

data "openstack_networking_network_v2" "network" {
  name = "dslab-demo"
}

resource "openstack_compute_keypair_v2" "keypair" {
  name = var.key_name
}

resource "openstack_compute_instance_v2" "basic" {
  name            = var.vm_name
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_id       = data.openstack_compute_flavor_v2.small.id
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  network {
    name = data.openstack_networking_network_v2.network.name
  }
}

output "ssh_key" {
  value = openstack_compute_keypair_v2.keypair.private_key
}
