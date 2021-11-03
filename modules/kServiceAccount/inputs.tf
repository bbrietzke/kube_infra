
variable "rules" {
  type = list(object({
    resources  = list(string),
    api_groups = list(string),
    verbs      = list(string)
  }))
  default = []
}

variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "deployment_labels" {
  type        = map(any)
  default     = {}
  description = "Labels to put on the deployment itself"
}