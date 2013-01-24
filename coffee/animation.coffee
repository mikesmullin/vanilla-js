# custom animation function
# similar to jQuery.animate() but much less cpu intense
# and can be throttled with an fps framerate
# e.g. $.ui.animation(element, params) # build animation
#      $.one(element).data('animate')(some_index) # trigger animation
#
# @param function from
#   (optional) callback to determine default from
# @param function step
#   function to perform custom step
$.ui.animation = (e, params) ->
  e.data 'step', step = (index) =>
    e.data 'animation_index', index
    params.step e, index
  e.data 'stop', -> e
  e.data 'animate', (to, duration='slow', from=null) =>
    is_numeric = (v) -> (not isNaN(v)) and v isnt null and v
    from = index = is_numeric(from) or
      is_numeric(from = if typeof params.from is 'function' then params.from() else params.from) or
      is_numeric(from = e.data 'animation_index') or
      0
    return if to is from

    # framerate throttle
    fps         = params.fps or 8
    frame       = 0
    frames      = (duration / 1000) * fps
    mspf        = duration / frames

    e.data 'stop', stop = (jumpToEnd) =>
      if timer = e.data 'animating'
        clearTimeout timer
        if jumpToEnd
          params.step e, to
      e
    stop()
    (=>
      if frame < frames
        index = $.ui.easing.easeOutSine frame, from, to, frames
        frame += 1
        step index
        e.data 'animating', setTimeout arguments.callee, mspf
      else
        params.step e, to
        e.data 'animation_index', to
        params.complete.call e, to if params.complete
    )()

$.ui.easing =
  easeOutSine: (frame, from, to, frames) -> (to-from) * Math.sin(frame/frames * (Math.PI/2)) + from
