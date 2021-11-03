

module "jenkins_namespace" {
  source = "../kNamespace"
  name   = var.namespace

  labels = merge(local.static_labels, var.deployment_labels)
}

module "var_lib_jenkins" {
  source      = "../nfs_persistent_volume"
  volume_name = local.volume_mount_name
  namespace   = module.jenkins_namespace.name
  capacity    = var.nfs_capacity
  server      = var.nfs_server
  path        = var.nfs_path
}

module "jenkins_deployment" {
  source = "../kDeployment/"

  namespace         = module.jenkins_namespace.name
  name              = var.name
  replicas          = local.replicas
  container_name    = local.container_name
  container_port    = local.container_port
  container_version = var.container_version
  limit_cpu         = var.limit_cpu
  limit_memory      = var.limit_memory
  request_cpu       = var.request_cpu
  request_memory    = var.request_memory
  service_port      = var.service_port
  startup = [{
    failure_threshold = 100
    period_seconds = 5
    http_path = "/login"
    http_port = 8080

  }]
  nfs_volumes = {
    "jenkins-volume" = {
      mount_path = "/var/jenkins_home"
      claim      = module.var_lib_jenkins.claim_name
    }
  }


  deployment_labels = merge(local.static_labels, var.deployment_labels)
}