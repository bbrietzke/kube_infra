output "volume_id" {
  value = kubernetes_persistent_volume.volume_one.id
}

output "volume_name" {
  value = kubernetes_persistent_volume.volume_one.metadata.0.name
}

output "claim_id" {
  value = kubernetes_persistent_volume_claim.claim_readwritemany.id
}

output "claim_name" {
  value = kubernetes_persistent_volume_claim.claim_readwritemany.metadata.0.name
}