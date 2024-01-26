local typedefs      = require "kong.db.schema.typedefs"


return {
  name               = "cluster_events",
  primary_key        = { "id" },
  db_export          = false,
  generate_admin_api = true,
  admin_api_name     = "clustering/events", -- we don't generate this, so just for reference
  ttl                = false,

  fields = {
    { id = typedefs.uuid { required = true, }, },
    { data = { type = "string", required = true, }, },
    { channel = { type = "string", required = true, }, },
    { at = { type = "number", timestamp = true, required = true, }, },
  },
}
