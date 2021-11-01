
variable "name" {
  type        = string
  description = "Name of the namespace"
  default     = "unnamed"
}

variable "labels" {
  type        = map(any)
  description = "Organizational Labels"
  default     = {}
}

variable "annotations" {
  type        = map(any)
  description = "Annotations"
  default     = {}
}