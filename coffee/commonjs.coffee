# CommonJS
#
# silence errors for the browser
module = {}

# now you can have modules working
# between node and browser this way:
#
# in node:
#
#   global.app = exports: {}
#   require('relative/path/to/file')()
#
# in browser:
#
#   window.app = exports: {}
#   window.require = (path) -> app.exports[path]
#   require('relative/path/to/file')()
#
# in module:
#
#   module.exports = app.exports['relative/path/to/file'] = (->
#     # define code in here
#   )
#
# NOTICE:
#
# * wrapping the module in a closure is only necessary
#   if it would define any variables in the global scope.
#
# * as always, setting `module.exports =` is only necessary
#   if it actually returns some value. however, since you
#   can also access the global variable (e.g. `app`), you
#   can sometimes also skip the `app.exports['...'] = ` if
#   all your module does is manipulate the global variable.
#
