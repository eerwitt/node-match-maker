Factory = require '../factories/factories'

describe 'User', ->
  it 'creates a user', (done) ->
    Factory.build 'user',  name: "test", (user) ->
      user.name.should.eql "test"
      done()

  it 'uppercases a user name', (done) ->
    Factory.build 'user', name: "test", (user) ->
      user.uppercase().should.eql "TEST"
      done()

  it 'records the current location of a user (lat, lng)', (done) ->
    Factory.build 'user', lat: 20.0, lng: -20.0, (user) ->
      user.lat.should.eql 20.0
      user.lng.should.eql -20.0
      done()
 
  it 'adds to the connection log', (done) ->
    Factory.build 'user', name: "tester", (user) ->
      user.logConnection latency: 20, essid: "home", (connection) ->
        connection.essid.should.eql "home"
        connection.latency.should.eql 20
        done()

  it 'sets an available flag to show they are available', (done) ->
    Factory.build 'user', available: yes, (user) ->
      user.available.should.eql yes
      done()

  it 'marks a user as unavailable', (done) ->
    Factory.build 'user', available: yes, (user) ->
      user.markUnavailable()
      user.available.should.eql no
      done()
