class Section < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :category
  validates :no_of_questions, presence: true,
            numericality: {
                only_integer: true,
                greater_than: 0
            }
end
