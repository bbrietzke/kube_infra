
variable rules {
    type = list(object({
        resource=string,
        api_group=string,
        verbs = list(string)
    }))
}

variable name {
    type = string
}