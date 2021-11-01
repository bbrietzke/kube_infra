
output "name" {
  value = var.name
}

output "id" {
  value = kubernetes_namespace.new_namespace.id
}