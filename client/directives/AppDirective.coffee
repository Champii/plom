class AppDirective extends Nodulator.Directive 'app', 'roomService', 'socket'

  joined: false
  started: false
  err: ''

  Init: ->
    @roomService.Join (err) =>
      @err = 'lol'
      return @err = 'Error joining' if err?

      @scope.joined = true
      console.log @
      @socket.On 'start_game', =>
        @scope.started = true


AppDirective.Init()
