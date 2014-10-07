class TranslationSerializer < ActiveModel::Serializer
  has_one :word1, class_name: :word
  has_one :word2, class: :word

  attributes :section, :times_right, :times_wrong, :times_skipped, :times_resetted
end