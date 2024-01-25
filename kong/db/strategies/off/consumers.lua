local kong      = kong
local fmt       = string.format
local http      = require "resty.http"
local cjson    = require "cjson.safe"

local Consumers = {}

function Consumers:select(id)
  -- Retrieve a consumer by id from the admin api :8001/consumers/:id
  local c = http.new()

  id = id.id or id
  if not id then
    return nil, "id is required"
  end

  local url = "http://localhost:8001/consumers/" .. id

  local response, err = c:request_uri(url, {
    method = "GET",
    headers = {
      ["Content-Type"] = "application/json",
    },
  })
  if err then
    return nil, err
  end

  local res = cjson.decode(response.body)
  print("res = " .. require("inspect")(res))

  return res
end

return Consumers
