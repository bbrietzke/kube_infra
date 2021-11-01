resource "kubernetes_persistent_volume" "volume_one" {
  metadata {
    name   = var.volume_name
    labels = merge(local.static_labels, var.labels)
  }

  spec {
    capacity = {
      storage = var.capacity
    }
    access_modes = ["ReadWriteMany", "ReadWriteOnce", "ReadOnlyMany"]

    persistent_volume_source {
      nfs {
        server    = var.server
        path      = var.path
        read_only = false
      }
    }
  }
}