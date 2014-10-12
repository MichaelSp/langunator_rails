# for more details see: http://emberjs.com/guides/models/defining-models/

LangunatorRails.Translation = DS.Model.extend
  section: DS.attr 'number', {defaultValue: 0}
  times_right: DS.attr 'number', {defaultValue: 0}
  times_wrong: DS.attr 'number', {defaultValue: 0}
  times_skipped: DS.attr 'number', {defaultValue: 0}
  times_resetted: DS.attr 'number', {defaultValue: 0}
  words: DS.hasMany 'word'

  word_by_language: (()->
    result = [];
    @get('words').forEach (word)->
      language = word.get 'language'
      found = result.findBy 'lang', language
      if !found
        result.pushObject(Ember.Object.create({lang: language, words: []}));
      result.findBy('lang', language).get('words').pushObject(word);
  ).property 'word1'