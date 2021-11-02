

resource "kubernetes_role" "role_rules" {
    metadata {
      name = format("%-rules", var.name)
    }
}