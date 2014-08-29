class Language < ActiveRecord::Base
  has_many :words

  validates_uniqueness_of :name

  def input_class
    case name
    when 'Greek' then 'greektext'
      else
        ''
    end
  end
end
