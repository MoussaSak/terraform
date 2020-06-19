terraform {
  required_providers {
    scaleway = {
      source = "terraform-providers/scaleway"
      version = "~> 1.15"
    }
  }
  required_version = "~> 0.12"
}
provider "scaleway" {
}
data "scaleway_instance_image" "ubuntu20" {
}
resource "scaleway_instance_server" "server_01" {
}
output "scaleway_images" {
}
