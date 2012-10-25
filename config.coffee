fs = require 'fs'

class Config
  config: {}

  constructor: (@environment = 'development') ->
    true

  loadConfig: ->
    @config = @_readConfig './config/' + @environment + '.json'
    @config

  _readConfig: (filename) ->
    rawConfig = fs.readFileSync filename
    @_parseConfig rawConfig

  _parseConfig: (rawConfig) ->
    JSON.parse rawConfig

config = new Config(process.env.NODE_ENV)
module.exports = config
