nconf   = require 'nconf'

_loadFileIntoConfig = (config, path, type) ->
  return config.file(type, "#{path}/#{type}.json")

_isVpn = (config) ->
  config = config.get()
  return config.VPN

module.exports  = (config) ->
  resolved = nconf.argv()
  resolved = resolved.env('__')

  if _isVpn resolved
    resolved = _loadFileIntoConfig(resolved, config.base_path, 'vpn')

  resolved = _loadFileIntoConfig(resolved, config.base_path, 'environment')
  resolved = _loadFileIntoConfig(resolved, config.base_path, 'defaults')

  return resolved.get()
