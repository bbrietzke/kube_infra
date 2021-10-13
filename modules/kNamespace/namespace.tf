
resource "kubernetes_namespace" "new_namespace" {
  metadata {
    annotations = var.annotations

    labels = merge(local.static_labels, var.labels)

    name = var.name
  }
}