User = require '../models/user'

class UserController
  availableUsers: (callback) ->
    User.find {available: yes}, (error, users) ->
      throw error if error?

      callback users

module.exports = UserController
