# facebookmsn
$(document).ready ->
  $('#fbmsn').click ->
    url_event = location.href
    url = url_event + '.html'
    FB.init
      appId: '870486713077037'
      xfbml: true
      cookie: true
    FB.ui
      method: 'send'
      name: 'Plakeit'
      link: url
    return
  return
