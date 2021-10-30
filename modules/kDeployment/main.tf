resource "kubernetes_deployment" "deployment" {
    metadata {
        name = var.name
        namespace = var.namespace
        labels = merge(local.static_labels, var.deployment_labels)
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
                container {
                    image = "${var.container_name}:${var.container_version}"
                    name  = var.name

                    stdin = var.stdin
                    tty  = var.tty

                    port {
                        container_port = var.container_port
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

                    # liveness_probe {
                    #     initial_delay_seconds = var.liveness_delay
                    #     period_seconds = 5

                    #     http_get {
                    #         path = var.liveness_probe_path
                    #         port = var.liveness_probe_port

                    #         http_header {
                    #             name = "X-Custom-LIVENESS"
                    #             value = var.liveness_header_value
                    #         }
                    #     }
                    # }

                    # volume_mount {
                    #     mount_path = var.volume_mount_path
                    #     name = var.volume_mount_name
                    #     read_only = false
                    # }
                }

                # volume {
                #     name = "local"
                #     local {
                #         path = "/opt/volumes"
                #     }
                # }

                # volume {
                #     name = var.volume_mount_name
                #     persistent_volume_claim {
                #         claim_name = var.volume_claim_name
                #         read_only = false
                #     }                    
                # }
            }
        }
    }
}