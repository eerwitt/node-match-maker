Factory = require '../factories/factories'

UserController = require '../../app/controllers/user'
User = require '../../app/models/user'

describe 'UserController', ->
  beforeEach ->
    User.collection.remove()

  it 'should start with 0 users in the test database', (done) ->
    User.find {}, (error, docs) ->
      throw error if error?
      docs.should.eql []
      done()

  it 'lists the available users for match making', (done) ->
    Factory.create 'user', name: 'test_1', available: yes, (user1) ->
      User.find {available: yes}, (error, docs) ->
        if error?
          console.log error
          throw error

        docs.should.eql [user1]
        done()

  it 'sets a user to unavailable for match making', (done) ->
    done()

  it "logs a user's connection information", (done) ->
    done()

  it "finds a geographically close user", (done) ->
    done()
