
resource "kubernetes_service_account" "account" {
    metadata {
      name = var.name
    }

    secret {
        name = "${kubernetes_secret.account_secret.metadata.0.name}"
    }
}

resource "kubernetes_secret" "account_secret" {
    metadata {
        annotations = {
            "kubernetes.io/service-account.name" = var.name
        }
    }

    type = "kubernetes.io/service-account-token"
}