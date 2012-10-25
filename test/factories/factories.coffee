Factory = require 'factory-lady'

# Models
User = require '../../app/models/user'

# Libraries

# Controllers
UserController = require '../../app/controllers/user.coffee'

Factory.define 'user', User,
  name: "test"
  lat: 20.0
  lng: -20.0
  latency: 20
  essid: "home"

Factory.define 'user_controller', UserController

module.exports = Factory
