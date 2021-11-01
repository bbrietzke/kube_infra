resource "kubernetes_persistent_volume_claim" "claim_readwritemany" {
  metadata {
    name      = join(".", ["${var.volume_name}", "rw"])
    namespace = var.namespace
    labels    = merge(local.static_labels, var.labels)
  }

  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = var.capacity
      }
    }
    volume_name = kubernetes_persistent_volume.volume_one.metadata.0.name
  }
}