define (require, exports, module) ->
  Engine = require 'famous/core/Engine'
  Surface = require 'famous/core/Surface'
  StateModifier = require 'famous/modifiers/StateModifier'
  Transform = require 'famous/core/Transform'
  Transitionable = require 'famous/transitions/Transitionable'
  SpringTransition = require 'famous/transitions/SpringTransition'
  Transitionable.registerMethod('spring', SpringTransition);

  mainContext = Engine.createContext()

  surface = new Surface
    size: [100, 100]
    properties:
      backgroundColor: 'yellow'

  stateModifier = new StateModifier
    origin: [0, 0]
    align: [0.5, 0.5]

  mainContext.add(stateModifier).add(surface)

  spring =
    method: 'spring'
    period: 1200
    dampingRatio: 0.25

  stateModifier.setTransform(
    Transform.rotate(0, 0, 0.25 * Math.PI), spring
  )

  undefined
