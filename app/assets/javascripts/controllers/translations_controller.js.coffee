LangunatorRails.TranslationsController = Ember.ArrayController.extend
  search: '',
  titleFilter: null,
  languages: @store.all('language').to_array()

  actions:
    sortBy: (property)->
      @set 'sortProperties', [property]
      @set 'sortAscending', !@get 'sortAscending'
    query: ->
      @set "titleFilter", @get("search")
    addNote: ->
      @transitionToRoute "main"

  arrangedContent: (->
    search = @get("search")
    return @get("content")  unless search
    @get("content").filter (translation) ->
      translation.get("word.name").indexOf(search) isnt -1

  ).property("content", "titleFilter")