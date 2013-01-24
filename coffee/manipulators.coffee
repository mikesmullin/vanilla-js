# Manipulators
# Element.prototype is IE8+
$.create = (html) -> e = $.createElement('div'); e.innerHTML = html; e.childNodes # convert string to DOM object
Element::append = $.appendChild # like jQuery().append() except receives object, not string
Element::appendTo = (o) -> o.append @; return @ # like jQuery().appendTo() except receives object, not string
Element::empty = -> @.innerHTML=''; return @ # like jQuery.empty()

# TODO: should just make some kind of $.extended(element) function
#       which returns the element extended with all the Element.prototype methods
#       instead of extending every Element in the DOM

Element::data = (k, v) ->
  return new Error('key is required as first argument to Element.prototype.data()') unless k
  return if v then @getAttribute k else @setAttribute k, v
