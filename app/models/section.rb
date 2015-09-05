class Section < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :category
  validates_presence_of :no_of_questions
end
