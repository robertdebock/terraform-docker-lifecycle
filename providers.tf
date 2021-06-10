terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.12.2"
    }
  }
}

provider "docker" {
  # host = "unix:///var/run/docker.sock"
  host = "ssh://fedora-34-x64-cloudtop.meinit.nl"
}
