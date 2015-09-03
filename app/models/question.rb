require 'choice'

class Question < ActiveRecord::Base
  has_many :choices

  validates_associated :choices
  validates_presence_of :description
end
