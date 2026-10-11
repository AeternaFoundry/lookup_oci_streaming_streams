variable "streaming_streams_lookup" {
  description = <<EOT
Map of streaming_streams_lookup, attributes below
Optional:
    - compartment_id
    - name
    - state
    - stream_pool_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id = optional(string)
    name           = optional(string)
    state          = optional(string)
    stream_pool_id = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

