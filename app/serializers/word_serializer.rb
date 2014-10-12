class WordSerializer < ActiveModel::Serializer
  has_one :language

  attributes :id, :name
end