nconf   = require 'nconf'

module.exports  = (config) ->
    nconf.argv()
        .env('__')
        .file('environment', config.base_path + '/environment.json')
        .file('defaults', config.base_path + '/defaults.json')
        #.file({ 'environment': config.base_path + '/environment.json' })
        #.file({ 'defaults': config.base_path + '/defaults.json' })
        
    return nconf.get()
    