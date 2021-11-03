
resource "kubernetes_role_binding" "j" {
  metadata {
    name      = local.binding_name
    namespace = var.namespace
  }

  role_ref {
    kind      = "Role"
    name      = local.role_name
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    namespace = var.namespace
    name      = local.account_name
  }
}