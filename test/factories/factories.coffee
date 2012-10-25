Factory = require 'factory-lady'

# Models
User = require '../../app/models/user'

# Libraries

Factory.define 'user', User,
  name: "test"
  lat: 20.0
  lng: -20.0
  latency: 20
  essid: "home"

module.exports = Factory
