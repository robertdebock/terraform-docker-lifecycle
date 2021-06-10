# Pulls the image
resource "docker_image" "default" {
  name = "robertdebock/mirror:latest"
}

# When using `lifecycle`, a unique string should be used to avoid conflicts.
variable "deployment_version" {
  type    = number
  default = 1
}

# Create a container
resource "docker_container" "default" {
  image = docker_image.default.latest
  name  = "mirror-${var.deployment_version}"
  env = [
    # "URL=https://www.flickr.com/photos/robertdebock"
    "URL=https://robertdebock.nl/"
  ]
  ports {
    internal = "443"
    external = "844${var.deployment_version}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
