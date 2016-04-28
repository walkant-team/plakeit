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
//= require clients/facebookmsn
//= require_self

$(function() {
  // flash messages
  $('.toast').delay(5000).fadeOut(1000);

  $('.button-collapse').sideNav();
  $('select').material_select();
  $('.parallax').parallax();

  window.addeventasync = function(){
    addeventatc.settings({
      css       : false,
      outlook   : { show: false },
      appleical : { show: false }
    });

    addeventatc.register('button-click', function(obj){
      if(gon.logged){
        $.post('reminders', { event_id: gon.event.id });
      } else {
        $('#' + obj.id).click();
        alert('Necesita estar logeado para agendar :)');
      }
    });

    addeventatc.register('button-dropdown-click', function(obj){
      window.location.reload();
    });
  };

  $('nav .icon-search').on('click', function(e){
    $('.search-widget').css('width', '300px');
    e.preventDefault()
  })

  category_regxp = /category/
  if( window.location.search || category_regxp.test(window.location.pathname) ) {
    position = $('#form-search').offset();
    console.log(position)
    window.scrollTo(0, position.top - 100);
  }
})
