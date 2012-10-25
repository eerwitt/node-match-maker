User = require '../models/user'

class UserController
  availableUsers: (callback) ->
    User.find {available: yes}, (error, users) ->
      throw error if error?

      callback users

  markUserUnavailable: (id, callback) ->
    User.findById id, (error, user) ->
      throw error if error?

      user.markUnavailable()
      callback user

  logConnection: (id, options, callback) ->
    User.findById id, (error, user) ->
      throw error if error?

      user.logConnection options, callback

module.exports = UserController
