require 'choice'

class Question < ActiveRecord::Base
  has_many :choice

  validates_associated :choice
  validates_presence_of :description
end
