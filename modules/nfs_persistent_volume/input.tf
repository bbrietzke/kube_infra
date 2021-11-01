
variable "volume_name" {
  type        = string
  description = "Name of the persistent volume"
  default     = "unnamed-volume"
}

variable "namespace" {
  type        = string
  description = "Namespace to put the persistent volume and the persistent volume claim"
  default     = "default"
}

variable "capacity" {
  type        = string
  description = "Nominal size of the volume"
  default     = "1Gi"
}

variable "server" {
  type        = string
  description = "host server for filesystem"
  default     = ""
}

variable "path" {
  type        = string
  description = "Path on server for volume"
  default     = ""
}

variable "labels" {
  description = "additional labels"
  type        = map(any)
  default     = {}
}