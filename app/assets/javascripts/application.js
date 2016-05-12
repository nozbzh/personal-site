//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-readyselector
//= require redactor-rails
//= require redactor-rails/plugins
//= require_tree .

$(document).ready(function() {
  $(".redact img").addClass("img-responsive center-block");
  $(".redact a").attr('target', '_blank');
});
