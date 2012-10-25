config = require '../config'
fs = require 'fs'

devConfigPath = './data/development.json'

describe 'Config', ->
  beforeEach ->
    fs.writeFileSync devConfigPath, JSON.stringify test: "value"

  afterEach ->
    fs.unlinkSync devConfigPath

  it 'parses a json string into a hash' , (done) ->
    config._parseConfig('{"test": 123}').test.should.eql 123
    done()

  it 'reads a JSON file and returns a hash', (done) ->
    config._readConfig(devConfigPath).test.should.eql "value"
    done()
