class Choice < ActiveRecord::Base
  attr_reader :text
  validates_presence_of :text

  def initialize(text, correct)
    @text = text
    @correct = correct
  end

  def correct?
    @correct
  end
end
