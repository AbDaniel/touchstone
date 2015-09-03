require 'choice'

class Question < ActiveRecord::Base
  has_many :choices
  has_and_belongs_to_many :categories

  validates_presence_of :description
  validates_presence_of :categories
end
