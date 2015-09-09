# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  exam_id     :integer
#  user_id     :integer
#  question_id :integer
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user
  belongs_to :question

  validates_presence_of :text
end
