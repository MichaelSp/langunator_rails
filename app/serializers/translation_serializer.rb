class TranslationSerializer < ActiveModel::Serializer
  has_many :words

  attributes :id, :section, :times_right, :times_wrong, :times_skipped, :times_resetted
end