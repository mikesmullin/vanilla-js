# XHR
#
# XMLHttpRequest is IE7+
#
# like jQuery.get() except method is first argument,
# and returns via Node.js callback pattern e.g.
#
#   cb = (err, responseText, statusText, xhr) ->
#     return throw err if err
#     console.log "Success!", responseText
#
$.xhr = (method, url, data, cb) ->
  try
    r = new XMLHttpRequest()
    r.open method, url, true
    r.onreadystatechange = ->
      return unless r.readyState is 4 # request complete
      if r.status isnt 200
        return cb r.statusText, null, r.status, r
      cb null, r.responseText, r.status, r
    r.send data or `undefined`
    return
  catch err
    return cb err, null, r.status, r
