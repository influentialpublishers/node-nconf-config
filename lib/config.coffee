nconf   = require 'nconf'

_loadFileIntoConfig = (config, path, type) ->
  return config.file(type, "#{path}/#{type}.json")

_isVpn = (config) ->
  config = config.get()
  return config.VPN

module.exports  = (config) ->
  resolved = nconf.argv()
  resolved = resolved.env('__')

  base = config.base_path
  if _isVpn resolved
    resolved = _loadFileIntoConfig(resolved, base, 'vpn_environment')
    resolved = _loadFileIntoConfig(resolved, base, 'vpn')

  resolved = _loadFileIntoConfig(resolved, base, 'environment')
  resolved = _loadFileIntoConfig(resolved, base, 'defaults')

  return resolved.get()
