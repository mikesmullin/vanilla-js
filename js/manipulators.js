// Generated by CoffeeScript 1.4.0

$.create = function(html) {
  var e;
  e = $.createElement('div');
  e.innerHTML = html;
  return e.childNodes;
};

Element.prototype.append = $.appendChild;

Element.prototype.appendTo = function(o) {
  o.append(this);
  return this;
};

Element.prototype.empty = function() {
  this.innerHTML = '';
  return this;
};
