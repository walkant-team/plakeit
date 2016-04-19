(function($, window, document, undefined) {

alert("ssss");
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
type:	'vk',
url:	location.href,
title:	metaOTitle,
text: metaOGDescription,
image:	metaOGImage
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

//Funcionalidades Twitter

tw: function(_options) {
var options = $.extend({
url: location.href,
title: metaOTitle,
text: metaOGDescription,
image: metaOGImage
}, _options);
return 'http://twitter.com/share?'
+ 'url=' + encodeURIComponent(options.url)
+ '&text=' + encodeURIComponent(options.title)
+ '&description=' + encodeURIComponent(options.text)
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
* Share counter > Vkontakte
* @see http://vk.com/dev
*/
if (existCount('[data-counter="vk"]')) {
$.getJSON('https://vk.com/share.php?act=count&index=1&url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {});
if (!window.VK) VK = {};
VK.Share = {
count: function(index, count) {
$('[data-counter="vk"]').text(roundCount(count));
}
};
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
/*
* Share counter > Odnoklassniki
* @see https://apiok.ru
*/
if (existCount('[data-counter="ok"]')) {
$.getJSON('https://connect.ok.ru/dk?st.cmd=extLike&uid=1&ref=' + encodeURIComponent(location.href) + '&callback=?', function(response) {});
if (!window.ODKL) ODKL = {};
ODKL.updateCount = function(index, count) {
$('[data-counter="ok"]').text(roundCount(count));
};
};
/*
* Share counter > Twitter
* @see https://dev.twitter.com
*/
/*if (existCount('[data-counter="tw"]')) {
$.getJSON('http://cdn.api.twitter.com/1/urls/count.json?url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
$('[data-counter="tw"]').text(roundCount(response.count));
});
};*/
/*
* Share counter > Google Plus
* @see https://developers.google.com/+/
*/
if (existCount('[data-counter="gp"]')) {
$.ajax({
type: 'POST',
url: 'https://clients6.google.com/rpc',
processData: true,
contentType: 'application/json',
data: JSON.stringify({
'method': 'pos.plusones.get',
'id': location.href,
'params': {
'nolog': true,
'id': location.href,
'source': 'widget',
'userId': '@viewer',
'groupId': '@self'
},
'jsonrpc': '2.0',
'key': 'p',
'apiVersion': 'v1'
}),
success: function(response) {
$('[data-counter="gp"]').text(roundCount(response.result.metadata.globalCounts.count));
}
});
};
/*
* Share counter > My@Mail.Ru
* @see http://api.mail.ru
*/
if (existCount('[data-counter="mr"]')) {
$.getJSON('http://connect.mail.ru/share_count?url_list=' + encodeURIComponent(location.href) + '&callback=1&func=?', function(response) {
var url = encodeURIComponent(location.href);
for (var url in response) {
if (response.hasOwnProperty(url)) {
var count = response[url].shares;
break;
}
}
if ($.isEmptyObject(response)) $('[data-counter="mr"]').text('0');
else $('[data-counter="mr"]').text(roundCount(count));
});
};
/*
* Share counter > LinkedIn
* @see https://developer.linkedin.com
*/
if (existCount('[data-counter="li"]')) {
$.getJSON('http://www.linkedin.com/countserv/count/share?url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
$('[data-counter="li"]').text(roundCount(response.count));
});
}
/*
* Share counter > tumblr
* @see https://www.tumblr.com/developers
*/
if (existCount('[data-counter="tm"]')) {
$.getJSON('http://api.tumblr.com/v2/share/stats?url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
$('[data-counter="tm"]').text(roundCount(response.response.note_count));
});
};
/*
* Share counter > Pinterest
* @see https://developers.pinterest.com
*/
if (existCount('[data-counter="pt"]')) {
$.getJSON('http://api.pinterest.com/v1/urls/count.json?url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
$('[data-counter="pt"]').text(roundCount(response.count));
});
};
/*
* Share counter > Reddit
* @see https://www.reddit.com/dev/api
*/
if (existCount('[data-counter="rd"]')) {
$.getJSON('https://www.reddit.com/api/info.json?url=' + encodeURIComponent(location.href) + '&jsonp=?', function(response) {
var count = response.data.children;
if (count.length === 0) $('[data-counter="rd"]').text('0');
else $('[data-counter="rd"]').text(roundCount(count[0].data.score));
});
};
/*
* Share counter > StumbleUpon
* @see http://help.stumbleupon.com
*/
if (existCount('[data-counter="su"]')) {
$.getJSON('http://query.yahooapis.com/v1/public/yql?q='
+ encodeURIComponent('select * from html where url="http://www.stumbleupon.com/services/1.01/badge.getinfo?url=' + location.href + '" and xpath="*"') + '&format=json&callback=?', function(response) {
var count = $.parseJSON(response.query.results.html.body);
if (count.result.views === undefined) $('[data-counter="su"]').text('0');
else $('[data-counter="su"]').text(roundCount(count.result.views));
});
};
/*
* Share counter > Pocket
* @see https://widgets.getpocket.com/v1/button?count=horizontal&url=[URL_HERE]
*/
if (existCount('[data-counter="po"]')) {
$.getJSON('http://query.yahooapis.com/v1/public/yql?q='
+ encodeURIComponent('select * from html where url="https://widgets.getpocket.com/v1/button?count=horizontal&url=' + location.href + '" and xpath="*"') + '&format=json&callback=?', function(response) {
$('[data-counter="po"]').text(roundCount(response.query.results.html.body.div.a.span.em.content));
});
};
/*
* Share counter > Buffer
* @see https://buffer.com/developers
*/
if (existCount('[data-counter="bf"]')) {
$.getJSON('https://api.bufferapp.com/1/links/shares.json?url=' + encodeURIComponent(location.href) + '&callback=?', function(response) {
$('[data-counter="bf"]').text(roundCount(response.shares));
});
};
/*
* Share counter > Xing
* @see https://www.xing-share.com/app/share?op=get_share_button;counter=top;url=[URL_HERE]
*/
if (existCount('[data-counter="xi"]')) {
$.getJSON('http://query.yahooapis.com/v1/public/yql?q='
+ encodeURIComponent('select * from html where url="https://www.xing-share.com/app/share?op=get_share_button;counter=top;url=' + location.href + '" and xpath="*"') + '&format=json&callback=?', function(response) {
$('[data-counter="xi"]').text(roundCount(response.query.results.html.body.div[0].div[0].span.content));
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
