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
//= require_self

$(document).ready(function(){
  $('#fbmsn').click(function(){
    var url_event= location.href;
    var url=url_event+".html";
      FB.init({appId: '870486713077037', xfbml: true, cookie: true});
      FB.ui({
          method: 'send',
          name: 'Plakeit',
          link: url,
          });
    });
  });
(function($, window, document, undefined) {
  $(document).ready(function() {
    /*
    * Variables
    */
    var metaOGDescription = ($('meta[property="og:description"]').attr('content')) ? $('meta[property="og:description"]').attr('content') : '';
    var metaOGImage = ($('meta[property="og:image"]').attr('content')) ? $('meta[property="og:image"]').attr('content') : '';
    var metaOTitle = ($('meta[property="og:title"]').attr('content')) ? $('meta[property="og:title"]').attr('content') : '';
    /*
    * Main function
    */
    goodshare = {
      init: function(_element, _options) {
        /*
        * Default options:
        *
        * type = vk
        * url = current browser adress stroke
        * title = current document <title>
        * text = current document <meta property="og:description" ... />
        * image = current document <meta property="og:image" ... />
        */
        var self = goodshare, options = $.extend({
          type: 'vk',
          url:  location.href,
          title:  metaOTitle,
          text: metaOGDescription,
          image:  metaOGImage
        }, $(_element).data(), _options);
        /*
        * Open popup
        */
        if (self.popup(link = self[options.type](options)) !== null) return false;
      },

      // Funcionales para facebook
      fb: function(_options) {
        var options = $.extend({
        url: location.href,
        title: metaOTitle,
        text: metaOGDescription,
        image: metaOGImage
        }, _options);
        return 'http://www.facebook.com/sharer.php?'
        + 'u=' + encodeURIComponent(options.url)
        + '&text=' + encodeURIComponent(options.title)
        + '&text=' + encodeURIComponent(options.text)
        + '&image=' + encodeURIComponent(options.image);
      },

      //Funcionalidades whatsapp
      wa: function(_options) {
        var options = $.extend({
          url: location.href,
          title: document.title
        }, _options);
        return 'whatsapp://send?'
        + 'text=' + encodeURIComponent(options.title + ' ' + options.url)
      },
      /*
      /*
      * Popup window
      */
      popup: function(url) {
        return window.open(url, '', 'toolbar=0,status=0,scrollbars=0,width=630,height=440');
      }
    };
    /*
    * Function getCount()
    * Set count to all elements with data-counter attribute.
    *
    * @example $(document).getCount(); // Get all counters
    */
    $.fn.getCount = function() {
    /*
    * Function roundCount()
    * Return rounded and pretty value of share count.
    *
    * @example roundCount(response.shares) // Rounded value of Facebook counter
    */
    var roundCount = function(number) {
      if (number > 999 && number <= 999999) var result = number/1000 + 'k';
      else if (number > 999999) var result = '>1M';
      else var result = number;
      return result;
    };
    /*
    * Function existCount()
    * Check exist counter element.
    *
    * @example existCount('[data-counter="fb"]') // Checked exist Facebook counter element
    */
    var existCount = function(element) {
      return ($(element).length > 0);
    };
    /*
    * Share counter > Facebook
    * @see https://developers.facebook.com
    */
    if (existCount('[data-counter="fb"]')) {
      $.getJSON('http://graph.facebook.com/?id=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
        if (response.shares === undefined) $('[data-counter="fb"]').text('0');
        else $('[data-counter="fb"]').text(roundCount(response.shares));
      });
    };
  };
  /*
  * Init click.
  */
  $(document).on('click', '.goodshare', function(event) {
    event.preventDefault();
    goodshare.init(this);
  });
  /*
  * Init share counters.
  */
  $(document).getCount();
  });
})(jQuery, window, document);

$(function() {
  $('select').material_select();
  $('.parallax').parallax();
  // maps
  var mapStyle = [
      {
          "featureType": "all",
          "elementType": "labels.text.fill",
          "stylers": [
              {
                  "color": "#ffffff"
              }
          ]
      },
      {
          "featureType": "all",
          "elementType": "labels.text.stroke",
          "stylers": [
              {
                  "color": "#000000"
              },
              {
                  "lightness": 13
              }
          ]
      },
      {
          "featureType": "administrative",
          "elementType": "geometry.fill",
          "stylers": [
              {
                  "color": "#000000"
              }
          ]
      },
      {
          "featureType": "administrative",
          "elementType": "geometry.stroke",
          "stylers": [
              {
                  "color": "#144b53"
              },
              {
                  "lightness": 14
              },
              {
                  "weight": 1.4
              }
          ]
      },
      {
          "featureType": "landscape",
          "elementType": "all",
          "stylers": [
              {
                  "color": "#08304b"
              }
          ]
      },
      {
          "featureType": "poi",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#0c4152"
              },
              {
                  "lightness": 5
              }
          ]
      },
      {
          "featureType": "road.highway",
          "elementType": "geometry.fill",
          "stylers": [
              {
                  "color": "#000000"
              }
          ]
      },
      {
          "featureType": "road.highway",
          "elementType": "geometry.stroke",
          "stylers": [
              {
                  "color": "#0b434f"
              },
              {
                  "lightness": 25
              }
          ]
      },
      {
          "featureType": "road.arterial",
          "elementType": "geometry.fill",
          "stylers": [
              {
                  "color": "#000000"
              }
          ]
      },
      {
          "featureType": "road.arterial",
          "elementType": "geometry.stroke",
          "stylers": [
              {
                  "color": "#0b3d51"
              },
              {
                  "lightness": 16
              }
          ]
      },
      {
          "featureType": "road.local",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#000000"
              }
          ]
      },
      {
          "featureType": "transit",
          "elementType": "all",
          "stylers": [
              {
                  "color": "#146474"
              }
          ]
      },
      {
          "featureType": "water",
          "elementType": "all",
          "stylers": [
              {
                  "color": "#021019"
              }
          ]
      }
  ];

  var handler = Gmaps.build('Google');
  handler.buildMap({
      internal: {id: 'custom_style'},
      provider: {
        zoom:      15,
        center:    new google.maps.LatLng(53.385873, -1.471471),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles:    mapStyle,
        lat:       -12.118071,
        lng:       -76.997861,
        scrollwheel:  false
      }
    },
    function(){ }
  );
})
