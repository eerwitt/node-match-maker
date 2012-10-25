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

  nearbyUsers: (lat, lng, distance, callback) ->
    if not distance?
      earthRadius = 6378#km
      range = 3000#km

      distance = range / earthRadius

    User.collection.geoNear lng, lat,
      query:
        available: yes
      uniqueDocs: true
      spherical: true
      maxDistance: distance,
      (error, users) ->
        throw error if error?

        callback users

module.exports = UserController
