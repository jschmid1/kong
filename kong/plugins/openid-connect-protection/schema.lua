local utils = require "kong.tools.utils"


local function check_user(anonymous)
  if anonymous == nil or anonymous == "" or utils.is_valid_uuid(anonymous) then
    return true
  end

  return false, "the anonymous user must be empty or a valid uuid"
end


return {
  no_consumer      = true,
  fields           = {
    client_id      = {
      required     = false,
      type         = "string",
    },
    client_secret  = {
      required     = false,
      type         = "string",
    },
    issuer         = {
      required     = true,
      type         = "url",
    },
    tokens         = {
      required     = false,
      type         = "array",
      enum         = { "id_token", "access_token" },
      default      = { "id_token", "access_token" },
    },
    redirect_uri   = {
      required     = false,
      type         = "url",
    },
    scopes         = {
      required     = false,
      type         = "array",
      default      = { "openid" },
    },
    claims         = {
      required     = false,
      type         = "array",
      enum         = { "iss", "sub", "aud", "azp", "exp", "iat", "auth_time", "at_hash", "alg", "nbf", "hd" },
      default      = { "iss", "sub", "aud", "azp", "exp", "at_hash" },
    },
    audience       = {
      required     = false,
      type         = "array",
    },
    domains        = {
      required     = false,
      type         = "array",
    },
    max_age        = {
      required     = false,
      type         = "number",
    },
    reverify       = {
      required     = false,
      type         = "boolean",
      default      = false,
    },
    consumer_claim = {
      required     = false,
      type         = "string",
    },
    consumer_by    = {
      required     = false,
      type         = "array",
      enum         = { "id", "username", "custom_id" },
      default      = { "custom_id" }
    },
    consumer_ttl   = {
      required     = false,
      type         = "number",
    },
    anonymous      = {
      type         = "string",
      func         = check_user,
    },
    leeway         = {
      required     = false,
      type         = "number",
      default      = 0,
    },
    http_version   = {
      required     = false,
      type         = "number",
      enum         = { 1.0, 1.1 },
      default      = 1.1,
    },
    ssl_verify     = {
      required     = false,
      type         = "boolean",
      default      = true,
    },
    timeout        = {
      required     = false,
      type         = "number",
      default      = 10000,
    },
  },
}
