

variable "container_version" {
  type        = string
  description = "Version number ( or latest if unset ) to be used"
  default     = "lts-jdk11"
}

variable "name" {
  type        = string
  description = "Name of this deployment"
  default     = "jenkins-ci"
}

variable "namespace" {
  type        = string
  description = "Namespace to host the containers"
  default     = "jenkins"
}

variable "deployment_labels" {
  type        = map(any)
  default     = {}
  description = "Labels to put on the deployment itself"
}

variable "limit_cpu" {
  type    = string
  default = "2"
}

variable "limit_memory" {
  type    = string
  default = "4G"
}

variable "request_cpu" {
  type    = string
  default = "1"
}

variable "request_memory" {
  type    = string
  default = "1Gi"
}

variable "nfs_capacity" {
  type    = string
  default = "10Gi"
}

variable "nfs_server" {
  type = string
}

variable "nfs_path" {
  type = string
}

variable "service_port" {
  type    = number
  default = 0
}

variable "arm" {
  type    = bool
  default = false
}