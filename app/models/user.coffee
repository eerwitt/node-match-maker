mongoose = require 'mongoose'
schema = mongoose.Schema
  connections: Array
  available: Boolean
  name: String
  location: Array

schema.index location: '2d'

User = mongoose.model 'User', schema

User::uppercase = ->
  this.name.toUpperCase()

User::logConnection = (options={}, callback) ->
  connection = options
  this.connections.push connection

  callback connection

User::markUnavailable = ->
  this.available = no
  this.save()

# Workaround for order consistancy
User::setLocation = (lat, lng) ->
  this.location = [lng, lat]
  this.save()

module.exports = User
