# Manipulators
# Element.prototype is IE8+
$.create = (html) -> ($.createElement('div').innerHTML = html).childNodes # convert string to DOM object
Element::append = $.appendChild # like jQuery().append() except receives object, not string
Element::appendTo = (o) -> o.append @; return # like jQuery().appendTo() except receives object, not string
Element::empty = -> @removeChild @lastChild while @hasChildNodes(); return # like jQuery.empty()
