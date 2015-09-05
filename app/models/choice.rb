# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  text        :string
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

class Choice < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :text
  validates :correct, :inclusion => {:in => [true, false]}

  def correct?
    self[:correct]
  end
end
