
variable "container_name" {
  type        = string
  description = "Name of the container to be used"
}

variable "container_version" {
  type        = string
  description = "Version number ( or latest if unset ) to be used"
  default     = "latest"
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "service_port" {
  type    = number
  default = 2680
}

variable "name" {
  type        = string
  description = "Name of this deployment"
}

variable "namespace" {
  type        = string
  description = "Namespace to host the containers"
}

variable "deployment_labels" {
  type        = map(any)
  default     = {}
  description = "Labels to put on the deployment itself"
}

variable "replicas" {
  type        = number
  default     = 1
  description = "Number of containers to run"
}

variable "limit_cpu" {
  type    = string
  default = "1"
}

variable "limit_memory" {
  type    = string
  default = "2G"
}

variable "request_cpu" {
  type    = string
  default = "0.5"
}

variable "request_memory" {
  type    = string
  default = "512M"
}

variable "liveness" {
  type = list(object({
    http_path = string
    http_port = string
    delay     = number
  }))
  default = []
}

variable "nfs_volumes" {
  type = map(object({
    mount_path = string,
    claim      = string
  }))
  default = {}
}

variable "stdin" {
  type    = bool
  default = false
}

variable "tty" {
  type    = bool
  default = false
}