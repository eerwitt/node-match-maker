mongoose = require 'mongoose'
schema = mongoose.Schema
  connections: Array
  name: String
  lat: Number
  lng: Number


module.exports = User
