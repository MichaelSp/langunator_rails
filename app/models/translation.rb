class Translation < ActiveRecord::Base
  belongs_to :word1, class_name: "Word", foreign_key: "word1_id", dependent: :destroy
  belongs_to :word2, class_name: "Word", foreign_key: "word2_id", dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :word1
  accepts_nested_attributes_for :word2

  after_initialize :set_defaults

  validates_presence_of :word1
  validates_presence_of :word2
  validates_numericality_of :section, only_integer: true, greater_than_or_equal_to: 0

  def self.search (qry)
    qry = "%#{qry}%"
    joins(:word1).joins(:word2).where("words.name LIKE ?", qry)
  end

  private
  def set_defaults
    self.section = 0
    self.word1 ||= Word.new
    self.word2 ||= Word.new
  end
end
