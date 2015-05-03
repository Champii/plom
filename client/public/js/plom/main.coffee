
class Main 

  constructor: (@socket) ->
    @stage = new Kinetic.Stage
      container: 'container'
        width: document.body.scrollWidth
        height: document.body.scrollHeight
  
    @layer = new Kinetic.Layer

    blueRect = new Kinetic.Rect
      x: 50
      y: 75
      width: 100
      height: 50
      fill: '#00D2FF'
      stroke: 'black'
      strokeWidth: 4

    @layer.add(blueRect)

    @stage.add(@layer)