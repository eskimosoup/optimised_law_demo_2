// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require slick.js/slick.js
//= require colorbox/jquery.colorbox.js
//= require vendor/foundation/libraries/fastclick
//= require vendor/foundation/libraries/jquery.cookie
//= require vendor/foundation/libraries/modernizr
//= require vendor/foundation/libraries/placeholder
//= require vendor/foundation/foundation
//= require vendor/match-height
//= require components/toggle-class

function setHeight() {
  $('.match-height').matchHeight({
    byRow: true,
    property: 'height'
  });
}
