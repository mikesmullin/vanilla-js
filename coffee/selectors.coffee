# Selectors
# HTML5 Selector API is IE8+
# Element.prototype is IE8+
$ = document
$.liveId = $.getElementById # like jQuery('#'+selector)[0]
$.liveTag = $.getElementsByTagName # like jQuery(tagName)
$.liveClass = $.getElementsByClassName # like jQuery(className)
$.one = $.querySelector # like jQuery(selector)[0]
$.all = $.querySelectorAll # like jQuery(selector)
Element::one = Element::querySelector # like jQuery(selector, this)[0]
Element::all = Element::querySelectorAll # like jQuery(selector, this)
