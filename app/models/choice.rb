class Choice < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :text
  validates :correct, :inclusion => {:in => [true, false]}

  def correct?
    self[:correct]
  end
end
