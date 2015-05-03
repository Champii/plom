Nodulator = require 'nodulator'



class RoomRoute extends Nodulator.Route

  # Override the Config() method
  Config: ->

    # And never forget to call the super()
    super()

    # Join bitch
    @Get '/join', @Auth(), (req, res) =>
    	@resource.Fetch 1, (err, room) ->

    	if !(req.user.id in room.rooms)
    		room.rooms.push req.user.id
    		room.Save (err) ->

    	else
    		console.warn 'Room panic'


class RoomResource extends Nodulator.Resource 'room', Nodulator.Route.DefaultRoute

RoomResource.Init()

module.exports = RoomResource

RoomResource.Create 
	rooms: []
, (err, room) ->