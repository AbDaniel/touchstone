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

  validates :choices, :length => {maximum: 4}
  validates_presence_of :description
  validates_presence_of :categories
end
