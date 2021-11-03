

resource "kubernetes_role" "role" {
  metadata {
    name      = local.role_name
    namespace = var.namespace
    labels    = local.all_labels
  }

  dynamic "rule" {
    for_each = { for x in var.rules : x.resources[0] => x }

    content {
      api_groups = tolist(rule.value["api_groups"])
      resources  = rule.value["resources"]
      verbs      = rule.value["verbs"]
    }
  }
}