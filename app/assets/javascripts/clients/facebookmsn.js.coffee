# facebookmsn
$(document).ready ->
  $('#fbmsn').click ->
    url_event = location.href
    url = url_event
    FB.init
      appId: '869593549833020'
      xfbml: true
      cookie: true
    FB.ui
      method: 'send'
      name: 'Juergon'
      link: url
    return
  return
