process.env.TEST__PROCESS__TEST   = 'process variable'

Config  = require __dirname + '/../../lib/config'

describe "Config", ->
    config = null
    
    beforeEach ->
        config  = Config({ base_path: __dirname + '/../config' })
        
    it 'should load from the default.json file', ->
        config.TEST.SOMETHING.should.eql "This is something"
        
    it 'should load from the environment.json file and override the defaults', ->
        config.TEST.ENVIRONMENT.should.eql 'environment specific'
        
    it 'should use process variables over defaults', ->
        config.TEST.PROCESS.TEST.should.eql 'process variable'