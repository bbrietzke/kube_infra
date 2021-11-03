
resource "kubernetes_service_account" "account" {
  metadata {
    name      = local.account_name
    namespace = var.namespace
  }
}