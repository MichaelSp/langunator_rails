lastResults = []
$('.selectize').removeClass('form-control').selectize
  create: true,
  sortField: 'text'

$('.greektext').on('keypress', (evt)->
  convertCharToggle this, true, evt
).keyup (evt) ->
  convertStr this, evt