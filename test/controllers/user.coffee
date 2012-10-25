Factory = require '../factories/factories'
User = require '../../app/models/user'

UserController = require '../../app/controllers/user'
userController = null

describe 'UserController', ->
  beforeEach ->
    User.collection.remove()
    userController = new UserController

  it 'should start with 0 users in the test database', (done) ->
    User.find {}, (error, docs) ->
      throw error if error?
      docs.should.eql []
      done()

  it 'lists the available users for match making', (done) ->
    Factory.create 'user', name: 'test_1', available: yes, (user) ->
      userController.availableUsers (users) ->
        users.length.should.eql 1
        users[0]._id.should.eql user._id
        done()

  it 'sets a user to unavailable for match making', (done) ->
    Factory.create 'user', available: yes, (user) ->
      userController.markUserUnavailable user._id, (updatedUser) ->
        updatedUser.available.should.eql no
        done()

  it "logs a user's connection information", (done) ->
    Factory.create 'user', (user) ->
      userController.logConnection user._id, essid: "home", strength: 2, ip: "127.0.0.1", latency: 20, (connection) ->
        connection.essid.should.eql "home"
        connection.strength.should.eql 2
        connection.ip.should.eql "127.0.0.1"
        connection.latency.should.eql 20

        done()

  it "finds a geographically close user", (done) ->
    done()
