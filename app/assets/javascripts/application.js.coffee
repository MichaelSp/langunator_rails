#= require jquery
#= require jquery_ujs
#= require bootstrap-sass-official
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require langunator_rails

# for more details see: http://emberjs.com/guides/application/
window.LangunatorRails = Ember.Application.create()

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