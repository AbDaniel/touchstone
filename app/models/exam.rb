# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  code        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#

class Exam < ActiveRecord::Base
  has_one :exam_configuration

  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :description
end
