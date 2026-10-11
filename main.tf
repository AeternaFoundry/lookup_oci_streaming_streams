data "oci_streaming_streams" "streaming_streams_lookup" {
  for_each = var.streaming_streams_lookup

  compartment_id = each.value.compartment_id
  name           = each.value.name
  state          = each.value.state
  stream_pool_id = each.value.stream_pool_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

