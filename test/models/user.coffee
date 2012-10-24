mongoose = require 'mongoose'

# Test DB
# TODO find a better location to initialize this
mongoose.connect 'mongodb://localhost/test'

User = require '../../app/models/user'
describe 'User', ->
  beforeEach ->
    User.collection.remove()

  it 'starts with a clean slate', (done) ->
    User.find {}, (error, docs) ->
      console.log docs
      docs.should.eql []
      done()

  it 'creates a user', (done) ->
    User.create name: "test", (error, user) ->
      user.name.should.eql "test"
      done()

  it 'uppercases a user name', (done) ->
    User.create name: "test", (error, user) ->
      user.uppercase().should.eql "TEST"
      done()

  it 'records the current location of a user (lat, lng)', (done) ->
    User.create lat: 20.0, lng: -20.0, (error, user) ->
      user.lat.should.eql 20.0
      user.lng.should.eql -20.0
      done()
 
  it 'adds to the connection log', (done) ->
    User.create name: "tester", (error, user) ->
      user.logConnection latency: 20, essid: "home", (connection) ->
        connection.essid.should.eql "home"
        connection.latency.should.eql 20
        done()
