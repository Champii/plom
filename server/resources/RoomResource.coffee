async = require 'async'

Nodulator = require 'nodulator'

ClientResource = require './ClientResource'

class RoomRoute extends Nodulator.Route

  # Override the Config() method
  Config: ->

    # And never forget to call the super()
    super()

    # Join bitch
    @Get '/join', @Auth(), (req, res) =>
      # console.log 'lol'
      @resource.Fetch 1, (err, room) ->

        if !(req.user.id in room.rooms)
          room.rooms.push req.user.id
          if room.rooms.length is 2
            room.StartGame()

          room.Save (err) ->

        else
          console.warn 'Room panic'

        res.sendStatus(200)

class RoomResource extends Nodulator.Resource 'room', RoomRoute

  StartGame: (done) ->
    async.map @rooms, (clientId, done) ->
      ClientResource.Fetch clientId, done
    , (err, users) ->
      return done err if err?

      Nodulator.Socket().EmitRoom 'room', 'start_game'
      console.log users

RoomResource.Init()

module.exports = RoomResource

RoomResource.Create
  rooms: []
, (err, room) ->
