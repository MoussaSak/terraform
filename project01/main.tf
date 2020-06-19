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

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 10
  type = "l_ssd"
}

## resource "scaleway_instance_security_group" "www" {
##  inbound_default_policy  = "drop"
##  outbound_default_policy = "accept"

##  inbound_rule {
##    action = "accept"
##    port   = "22"
##    ip     = "212.47.225.64"
##  }

##  inbound_rule {
##    action = "accept"
##    port   = "80"
##  }

##  inbound_rule {
##    action = "accept"
##    port   = "443"
##  }
## }
data "scaleway_instance_image" "ubuntu20" {
	name = "ubuntu 20.04"
}

resource "scaleway_instance_server" "server_01" {

  type  = "DEV1-S"
  image = data.scaleway_instance_image.ubuntu20.id

  tags = [ "front", "web", "server-01" ]

  ##ip_id = scaleway_instance_ip.public_ip.id

  ##additional_volume_ids = [ scaleway_instance_volume.data.id ]

 # #security_group_id = scaleway_instance_security_group.www.id
}

output "scaleway_images" {
   value = data.scaleway_instance_image.ubuntu20.id
}
