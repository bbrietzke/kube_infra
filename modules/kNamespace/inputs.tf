
variable name {
    type = string
    description = "Name of the namespace"
    default = "unnamed"
}

variable labels {
    type = map
    description = "Organizational Labels"
    default = {}
}

variable annotations {
    type = map 
    description = "Annotations"
    default = {}
}