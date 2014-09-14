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
    origin: [0.5, 0.5]
    align: [0.5, 0.5]

  mainContext.add(stateModifier).add(surface)

  spring =
    method: 'spring'
    period: 1000
    dampingRatio: 0.3

  stateModifier.setTransform(
    Transform.rotate(0, 0, 1), spring
  )

  undefined
