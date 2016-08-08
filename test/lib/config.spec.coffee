Config  = require __dirname + '/../../lib/config'

describe '/lib/config.coffee :: defaults.json', ->
  it 'should load from the default.json file', ->
    process.env.VPN                   = false
    config = Config({ base_path: __dirname + '/../config' })
    config.TEST.SOMETHING.should.eql 'This is something'
    config.TEST.WTF.should.eql 'Defaults'


describe '/lib/config.coffee :: environment.json', ->
  it 'should load from the environment.json file and override the defaults', ->
    process.env.VPN                   = false
    config = Config({ base_path: __dirname + '/../config_environment' })
    config.TEST.SOMETHING.should.eql 'This is something'
    config.TEST.ENVIRONMENT.should.eql 'environment specific'
    config.TEST.WTF.should.eql 'Environment'


describe '/lib/config.coffee :: vpn.json', ->
  it 'should use vpn settings if the environment is a VPN environment', ->
    process.env.VPN               = true
    config = Config({ base_path: __dirname + '/../config_vpn' })
    config.TEST.SOMETHING.should.eql 'This is something'
    config.TEST.ENVIRONMENT.should.eql 'environment specific'
    config.TEST.VPN.TEST.should.eql 'vpn specific'
    config.TEST.WTF.should.eql 'Vpn'


describe '/lib/config.coffee :: process', ->
  it 'should use process variables over defaults', ->
    process.env.VPN                   = true
    process.env.TEST__PROCESS__TEST   = 'process variable'
    process.env.TEST__WTF             = 'Process'

    config = Config({ base_path: __dirname + '/../config_process' })
    config.TEST.SOMETHING.should.eql 'This is something'
    config.TEST.PROCESS.TEST.should.eql 'process variable'
    config.TEST.WTF.should.eql 'Process'
