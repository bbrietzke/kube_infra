locals {
  static_labels = {
    "terraform"  = true
    "kube_infra" = true
    "app"        = var.name
  }

  service_type = var.replicas > 1 ? "ClusterIP" : "NodePort"
  service_port = var.service_port > 0 ? var.service_port + 30000 : random_integer.random_port.result + 30000
}


resource "random_integer" "random_port" {
  min = 0
  max = 2767
}