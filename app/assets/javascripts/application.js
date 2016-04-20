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
//= require base/modernizr.min
//= require materialize-sprockets
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require clients/map.google
//= require_self
//= require clients/facebookmsn
//= require clients/social

$(function() {
  $('select').material_select();
  $('.parallax').parallax();

  window.addeventasync = function(){
    addeventatc.settings({
      css        : false
    });

    addeventatc.register('button-click', function(obj){
      if(gon.logged){
        $.post('reminders', { event_id: gon.event.id, user_id: gon.current_user.id });
      } else {
        $('#' + obj.id).click();
        alert('Necesita estar logeado para agendar :)');
      }
    });

    addeventatc.register('button-dropdown-click', function(obj){
      window.location.reload();
    });

  };
})
