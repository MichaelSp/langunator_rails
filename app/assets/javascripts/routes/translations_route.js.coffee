LangunatorRails.TranslationsRoute = Ember.Route.extend
  model: ()->
    @store.find('translation')