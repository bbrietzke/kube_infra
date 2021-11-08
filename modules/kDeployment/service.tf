
resource "kubernetes_service" "service" {
  metadata {
    name      = format("%s-%s", var.name, "service")
    namespace = var.namespace
    labels    = merge(local.static_labels, var.deployment_labels)
  }

  spec {
    selector = {
      app = var.name
    }

    dynamic "port" {
      for_each = { for p in var.ports : p.name => p }

      content {
        name        = port.key
        port        = port.value["port"]
        target_port = port.value["port"]
        node_port   = port.value["service_port"]
      }
    }

    type             = local.service_type
    session_affinity = "ClientIP"
  }
}