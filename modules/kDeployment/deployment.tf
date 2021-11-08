resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels    = merge(local.static_labels, var.deployment_labels)
  }

  spec {
    replicas = 1
    selector {
      match_labels = merge(local.static_labels, var.deployment_labels)
    }
    template {
      metadata {
        labels = merge(local.static_labels, var.deployment_labels)
      }
      spec {
        service_account_name = var.service_account

        container {
          image = "${var.container_name}:${var.container_version}"
          name  = var.name

          stdin = var.stdin
          tty   = var.tty

          dynamic "port" {
            for_each = { for p in var.ports : p.name => p }

            content {
              name = port.key
              container_port = port.value["port"]
              host_port = port.value["port"]
            }
          }

          resources {
            limits = {
              cpu    = var.limit_cpu
              memory = var.limit_memory
            }

            requests = {
              cpu    = var.request_cpu
              memory = var.request_memory
            }
          }

          dynamic "startup_probe" {
            for_each = { for l in var.startup : l.http_path => l }

            content {
              initial_delay_seconds = 30
              period_seconds        = startup_probe.value["period_seconds"]
              failure_threshold     = startup_probe.value["failure_threshold"]

              http_get {
                path = startup_probe.value["http_path"]
                port = startup_probe.value["http_port"]
              }

            }
          }

          dynamic "liveness_probe" {
            for_each = { for l in var.liveness : l.http_path => l }
            content {
              initial_delay_seconds = 10
              period_seconds        = liveness_probe.value["period_seconds"]
              failure_threshold     = liveness_probe.value["failure_threshold"]

              http_get {
                path = liveness_probe.value["http_path"]
                port = liveness_probe.value["http_port"]
              }
            }
          }

          dynamic "volume_mount" {
            for_each = var.nfs_volumes

            content {
              mount_path = volume_mount.value["mount_path"]
              name       = volume_mount.key
              read_only  = false
            }
          }
        }

        dynamic "volume" {
          for_each = var.nfs_volumes

          content {
            name = volume.key
            persistent_volume_claim {
              claim_name = volume.value["claim"]
              read_only  = false
            }
          }
        }
      }
    }
  }
}