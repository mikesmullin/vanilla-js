## Vanilla JS - fast, lightweight, cross-platform framework

jQuery-like Aliases (NOT Wrappers) to HTML5 Selector API / Raw Document

* Cross-browser compatible*
  * *HTML5 Selector API is [IE8+](http://www.webdirections.org/blog/html5-selectors-api-its-like-a-swiss-army-knife-for-the-dom/)
  * *XMLHttpRequest is [IE7+](https://developer.mozilla.org/en-US/docs/DOM/XMLHttpRequest)
  * *Element.prototype is [IE8+](http://msdn.microsoft.com/en-us/library/dd282900%28VS.85%29.aspx)
* Forget chaining; its [too expensive](http://jsperf.com/jqm3/85)

Inspired by the classic parody [vanilla-js.com](http://vanilla-js.com/).

## Demonstration

```coffeescript
# btw its XHR, not AJAX
# in Node.js callback style
$.xhr 'GET', 'http://coffeescript.org/robots.txt', '', (err, data, status, xhr) ->
  return console.log err, data, status, xhr, xhr.readyState, xhr.status if err
  console.log status
  console.log data

p = $.liveTag('p')
pp = $.all('p')
console.log p.length
console.log pp.length
#console.log $.one('body').append($.create('p'))
console.log $.create('p').appendTo($.one('body'))
console.log p.length # will be +1
console.log pp.length # will be same as before
```

## View Source

Commented code is in [./coffee/](https://github.com/mikesmullin/vanilla-js/blob/stable/coffee/)

## Helpful

* [quirksmode.org](http://www.quirksmode.org/dom/w3c_html.html)
