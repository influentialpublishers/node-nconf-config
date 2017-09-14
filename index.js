const nconf   = require('nconf');

const _loadFileIntoConfig = (config, path, type) => config.file(type, `${path}/${type}.json`);

const _isVpn = function(config) {
  config = config.get();
  return config.VPN;
};

module.exports  = function(config) {
  let resolved = nconf.argv();
  resolved = resolved.env('__');

  const base = config.base_path;
  if (_isVpn(resolved)) {
    resolved = _loadFileIntoConfig(resolved, base, 'vpn_environment');
    resolved = _loadFileIntoConfig(resolved, base, 'vpn');
  }

  resolved = _loadFileIntoConfig(resolved, base, 'environment');
  resolved = _loadFileIntoConfig(resolved, base, 'defaults');

  return resolved.get();
};
