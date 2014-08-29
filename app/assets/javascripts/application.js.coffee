#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require smart_listing
#= require microplugin
#= require sifter
#= require selectize

#= require_tree .

onlineStatus = (state)->
  klass = if (state.type == 'online') then 'online'   else 'offline'
  $('body').removeClass 'online'
  $('body').removeClass 'offline'
  $('body').addClass klass

ready = ->
  $(window).bind("online", onlineStatus);
  $(window).bind("offline", onlineStatus);
  onlineStatus
      type: (if window.navigator.onLine then 'online' else 'offline')

$(document).ready ready
$(document).on 'page:load', ready