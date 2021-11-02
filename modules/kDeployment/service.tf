
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

    port {
      port        = var.container_port
      target_port = var.container_port
      node_port   = local.service_port
    }

    type             = local.service_type
    session_affinity = "ClientIP"
  }
}