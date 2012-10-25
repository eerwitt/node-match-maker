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
    Factory.create 'user', name: 'test_1', available: yes, (user1) ->
      userController.availableUsers (users) ->
        users.length.should.eql 1
        users[0]._id.should.eql user1._id
        done()

  it 'sets a user to unavailable for match making', (done) ->
    done()

  it "logs a user's connection information", (done) ->
    done()

  it "finds a geographically close user", (done) ->
    done()
