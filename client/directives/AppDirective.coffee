class AppDirective extends Nodulator.Directive 'app', 'roomService', 'socket'

  joined: false
  started: false
  err: ''

  Init: ->
    @roomService.Join (err) =>
      return @err = 'Error joining' if err?

      @joined = true

      @socket.On 'start_game', =>
        @started = true

AppDirective.Init()
