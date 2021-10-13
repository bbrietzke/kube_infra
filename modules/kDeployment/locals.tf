locals {
    static_labels = {
        "terraform" = true
        "kube_infra" = true
        "app" = var.name
    }
}