locals {
  static_labels = {
    "terraform"  = true
    "kube_infra" = true
    "app"        = var.name
  }

  service_type = var.replicas > 1 ? "ClusterIP" : "NodePort"
}


resource "random_integer" "random_port" {
  min = 0
  max = 2767
}