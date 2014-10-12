# for more details see: http://emberjs.com/guides/models/defining-models/

LangunatorRails.Word = DS.Model.extend
  name: DS.attr 'string'
  language: DS.belongsTo 'language'