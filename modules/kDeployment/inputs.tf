
variable container_name {
    type = string
    description = "Name of the container to be used"
}

variable container_version {
    type = string
    description = "Version number ( or latest if unset ) to be used"
    default = "latest"
}

variable containter_port {
    type = number
    default = 8080
}

variable name {
    type = string
    description = "Name of this deployment"
}

variable namespace {
    type = string
    description = "Namespace to host the containers"
}

variable deployment_labels {
    type = map
    default = {}
    description = "Labels to put on the deployment itself"
}

variable replicas {
    type = number
    default = 1
    description = "Number of containers to run"
}

variable cpu_request {
    type = string 
    default = "0.5"
}

variable cpu_memory {
    type = string
    default = "128Mi"
}

variable liveness_probe_path {
    type = string
    default = "/alive"
}

variable liveness_probe_port {
    type = string
    default = 8080
}

variable liveness_header_value {
    type = string
    default = "6ed23aa2771449c4b0c59e7105f6b62c"
}

variable volume_mount_path {
    type = string
    default = ""
}

variable volume_mount_name {
    type = string
    default = ""
}

variable volume_claim_name {
    type = string
    default = ""
}

variable liveness_delay {
    type = number
    default = 60
}