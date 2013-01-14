# Enumerators
# like Underscore.js

_ = {}

_.extend = ->
  a = arguments
  i = a.length
  while i-- > 1
    b = a[i]
    for k of b
      a[0][k] = b[k]
  return a[0]

#_.deepExtend = ->
