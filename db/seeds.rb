# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gr = Language.create name: 'Greek'
de = Language.create name: 'German'

Translation.create word1: Word.create(language: de, name: 'die Zeit'), word2: Word.create(language: gr, name: 'ὁ χρονοσ')
Translation.create word1: Word.create(language: de, name: 'der Zeitpunkt'), word2: Word.create(language: gr, name: 'ὁ καιροσ')