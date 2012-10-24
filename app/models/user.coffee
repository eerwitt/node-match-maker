mongoose = require 'mongoose'
schema = mongoose.Schema
  connections: Array
  name: String
  lat: Number
  lng: Number

User = mongoose.model 'User', schema

User::uppercase = () ->
  this.name.toUpperCase()

User::logConnection = (options={}, callback) ->
  connection = options
  this.connections.push connection

  callback connection

module.exports = User
