# Manipulators
# Element.prototype is IE8+
$.create = (html) -> e = $.createElement('div'); e.innerHTML = html; e.childNodes # convert string to DOM object
Element::append = $.appendChild # like jQuery().append() except receives object, not string
Element::appendTo = (o) -> o.append @; return @ # like jQuery().appendTo() except receives object, not string
Element::empty = -> @.innerHTML=''; return @ # like jQuery.empty()
