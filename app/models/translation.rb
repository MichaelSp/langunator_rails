class Translation < ActiveRecord::Base
  #belongs_to :word1, class_name: "Word", foreign_key: "word1_id", dependent: :destroy
  #belongs_to :word2, class_name: "Word", foreign_key: "word2_id", dependent: :destroy
  has_and_belongs_to_many :words
  belongs_to :user

  accepts_nested_attributes_for :words

  after_initialize :set_defaults

  validates_length_of :words, minimum: 2
  validates_numericality_of :section, only_integer: true, greater_than_or_equal_to: 0

  def self.search (qry)
    qry = "%#{qry}%"
    joins(:words).where("words.name LIKE ?", qry)
  end

  private
  def set_defaults
    self.section ||= 0
    self.words ||= [Word.new, Word.new]
    self.times_right ||= 0
    self.times_wrong ||= 0
    self.times_skipped ||= 0
    self.times_resetted ||= 0
  end
end
