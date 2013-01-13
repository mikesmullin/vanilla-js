# Selectors
# HTML5 Selector API is IE8+
# Element.prototype is IE8+
$ = document
$.liveId = $.getElementById
$.liveTag = $.getElementsByTagName
$.liveClass = $.getElementsByClassName
$.one = $.querySelector
$.all = $.querySelectorAll
Element::one = Element::querySelector
Element::all = Element::querySelectorAll

# Manipulators
# Element.prototype is IE8+
$.create = (html) -> ($.createElement('div').innerHTML = html).childNodes
Element::append = $.appendChild
Element::appendTo = (o) -> o.append @; return
Element::empty = -> @removeChild @lastChild while @hasChildNodes(); return

# XHR
# XMLHttpRequest is IE7+
# in Node.js callback pattern
# cb should accept (err, responseText, statusText, xhr)
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
