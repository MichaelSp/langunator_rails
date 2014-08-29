class Word < ActiveRecord::Base
  belongs_to :language
  has_many :translations

  accepts_nested_attributes_for :language

  validates_presence_of :language

  after_initialize :set_defaults

  private
    def set_defaults
      self.language ||= Language.new
    end
end
