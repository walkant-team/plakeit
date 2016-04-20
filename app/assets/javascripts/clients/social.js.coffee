# redes sociales
(($, window, document) ->
  $(document).ready ->

    ###
    * Variables
    ###

    metaOGDescription = if $('meta[property="og:description"]').attr('content') then $('meta[property="og:description"]').attr('content') else ''
    metaOGImage = if $('meta[property="og:image"]').attr('content') then $('meta[property="og:image"]').attr('content') else ''
    metaOTitle = if $('meta[property="og:title"]').attr('content') then $('meta[property="og:title"]').attr('content') else ''

    ###
    * Main function
    ###

    goodshare =
      init: (_element, _options) ->

        ###
        * Default options:
        *
        * type = vk
        * url = current browser adress stroke
        * title = current document <title>
        * text = current document <meta property="og:description" ... />
        * image = current document <meta property="og:image" ... />
        ###

        self = goodshare
        options = $.extend({
          type: 'vk'
          url: location.href
          title: metaOTitle
          text: metaOGDescription
          image: metaOGImage
        }, $(_element).data(), _options)

        ###
        * Open popup
        ###

        if self.popup(link = self[options.type](options)) != null
          return false
        return
      fb: (_options) ->
        options = $.extend({
          url: location.href
          title: metaOTitle
          text: metaOGDescription
          image: metaOGImage
        }, _options)
        'http://www.facebook.com/sharer.php?' + 'u=' + encodeURIComponent(options.url) + '&text=' + encodeURIComponent(options.title) + '&text=' + encodeURIComponent(options.text) + '&image=' + encodeURIComponent(options.image)
      wa: (_options) ->
        options = $.extend({
          url: location.href
          title: document.title
        }, _options)
        'whatsapp://send?' + 'text=' + encodeURIComponent(options.title + ' ' + options.url)
      popup: (url) ->
        window.open url, '', 'toolbar=0,status=0,scrollbars=0,width=630,height=440'

    ###
    * Function getCount()
    * Set count to all elements with data-counter attribute.
    *
    * @example $(document).getCount(); // Get all counters
    ###

    $.fn.getCount = ->

      ###
      * Function roundCount()
      * Return rounded and pretty value of share count.
      *
      * @example roundCount(response.shares) // Rounded value of Facebook counter
      ###

      roundCount = (number) ->
        `var result`
        `var result`
        if number > 999 and number <= 999999
          result = number / 1000 + 'k'
        else if number > 999999
          result = '>1M'
        else
          result = number
        result

      ###
      * Function existCount()
      * Check exist counter element.
      *
      * @example existCount('[data-counter="fb"]') // Checked exist Facebook counter element
      ###

      existCount = (element) ->
        $(element).length > 0

      ###
      * Share counter > Facebook
      * @see https://developers.facebook.com
      ###

      if existCount('[data-counter="fb"]')
        $.getJSON 'http://graph.facebook.com/?id=' + encodeURIComponent(location.href) + '&callback=?', (response) ->
          if response.shares == undefined
            $('[data-counter="fb"]').text '0'
          else
            $('[data-counter="fb"]').text roundCount(response.shares)
          return
      return

    ###
    * Init click.
    ###

    $(document).on 'click', '.goodshare', (event) ->
      event.preventDefault()
      goodshare.init this
      return

    ###
    * Init share counters.
    ###

    $(document).getCount()
    return
  return
) jQuery, window, document
