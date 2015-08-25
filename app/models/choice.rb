class Choice < ActiveRecord::Base
  validates_presence_of :text
  validates :correct, :inclusion => {:in => [true, false]}

  def correct?
    self[:correct]
  end
end
