class RoomDirective extends Nodulator.Directive 'room', 'roomService'

  Init: ->
    @roomService.Join()

RoomDirective.Init()