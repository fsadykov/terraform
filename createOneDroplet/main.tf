provider "digitalocean" {
  token = "3aaf0665aae0ec8dc5fa9046cb1b2ab1c2143a260f94ff3ef635ca5da5cefbf7"
}


resource "digitalocean_droplet" "web" {
  image = "centos-7-x64"
  name = "Template"
  region = "nyc3"
  size = "1gb"
}
