mongoose = require 'mongoose'

# Test DB
# TODO find a better location to initialize this
mongoose.connect 'mongodb://localhost/test'

User = require '../../app/models/user'
describe 'Users', ->
  it 'creates a user', (done) ->
    User.create name: "test", (error, user) ->
      user.name.should.eql "test"
      done()
