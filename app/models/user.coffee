mongoose = require 'mongoose'
schema = mongoose.Schema
  connections: Array
  name: String
  lat: Number
  lng: Number

User = mongoose.model 'User', schema

User::uppercase = () ->
  this.name.toUpperCase()

module.exports = User
