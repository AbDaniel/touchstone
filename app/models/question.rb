# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'choice'

class Question < ActiveRecord::Base
  has_many :choices
  has_and_belongs_to_many :categories

  def correct_choice?(chosen_choice_text)
    choices.any? do |choice|
      choice.correct? if choice.text == chosen_choice_text
    end
  end

  validates :choices, :length => {maximum: 4}
  validate :uniqueness_of_choices
  validates_presence_of :description
  validates_presence_of :categories

  def uniqueness_of_choices
    choice_list = choices.map { |choice| [choice.text] }
    has_duplicate_choices = choice_list.any? { |e| choice_list.count(e) > 1 }
    errors.add(:choices, 'The choices is not now unique') if has_duplicate_choices
  end
end
