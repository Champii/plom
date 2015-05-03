class RoomService extends Nodulator.Service 'room', '$http'

  Join: (done) ->
    @$http.get '/api/1/rooms/join'
      .success ->
        done() if done?
      .error (code, data) ->
        done data if done?

RoomService.Init()
