locals {
  static_labels = {
    "terraform"  = true
    "kube_infra" = true
    "kJenkins"   = true
    "app"        = var.name
  }

  replicas              = 1
  container_name        = var.arm ? "bbrietzke/jenkins" : "jenkins/jenkins"
  container_port        = 8080
  volume_mount_path     = "/var/lib/jenkins"
  volume_mount_name     = "var-lib-jenkins"
  liveness_header_value = "6ed23aa2771449c4b0c59e7105f6b62c"
  liveness_probe_path   = "/login"
  liveness_probe_port   = "8080"
  liveness_delay        = 120
}