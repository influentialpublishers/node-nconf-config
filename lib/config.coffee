nconf   = require 'nconf'

module.exports  = (config) ->
    nconf.arg()
        .env('__')
        .file({ 'file': config.base_path + '/environment.json' })
        .file({ 'file': config.base_path + '/defaults.json' })
        
    return nconf.get()
    