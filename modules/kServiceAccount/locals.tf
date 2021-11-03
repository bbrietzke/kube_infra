locals {
  static_labels = {
    "terraform"  = true
    "kube_infra" = true
    "app"        = var.name
  }

  all_labels = merge(local.static_labels, var.deployment_labels)

  binding_name  = format("%s-binding", var.name)
  role_name  = format("%s-role", var.name)
  account_name = var.name
}