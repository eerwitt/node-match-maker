Factory = require 'factory-lady'
mongoose = require 'mongoose'

# Connecting to a test db
# TODO change connection string to read from config
mongoose.connect 'mongodb://localhost/test'

# Models
User = require '../../app/models/user'

# Libraries

Factory.define 'user', User,
  name: "test"
  lat: 20.0
  lng: -20.0
  latency: 20
  essid: "home"

Factory.define 'user_controller', UserController

module.exports = Factory
