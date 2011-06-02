// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  var elements = [ "input[type=text]", "input[type=email]", "input[type=password]" ];
  for (var i=0; i < elements.length; i++) {
    $(elements[i]).addClass('text');
  }
});
